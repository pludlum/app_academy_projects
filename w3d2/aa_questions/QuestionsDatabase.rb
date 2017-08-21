require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton

  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class User
  attr_accessor :fname, :lname

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map {|datum| User.new(datum)}
  end

  def self.find_by_id(target)
    data = QuestionsDatabase.instance.execute(<<-SQL, target)
      SELECT
        *
      FROM
        users
      WHERE
        id = ?
    SQL

    raise 'Nothing found!' if data.empty?
    User.new(data.first)
  end

  def self.find_by_name(fname, lname)
    data = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
        fname = ?
        AND
        lname = ?
    SQL
    data.map {|datum| User.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']
  end


  def save
    if @id
      update
    else
      create
    end
  end

  def create
    raise 'Already exists in DB' if @id
    data = QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname)
      INSERT INTO
        users (fname, lname)
      Values
        (?, ?)

        SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
  raise 'does not exist in DB' unless @id
  data = QuestionsDatabase.instance.execute(<<-SQL, @fname, @lname, @id)
    UPDATE
      users
    SET
      fname = ?, lname = ?
    WHERE
      id = ?
    SQL
  end

  def authored_questions
    Question.find_by_author_id(@id)
  end

  def authored_replies
    Reply.find_by_user_id(@id)
  end

  def followed_questions
    QuestionFollow.followed_questions_for_user_id(@id)
  end

  def liked_questions
    Like.liked_questions_for_user_id(@id)
  end

  def average_karma
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
      SELECT
        CAST(COUNT(question_likes.id) AS FLOAT)/COUNT(DISTINCT(questions.id))
      FROM
        questions
      LEFT OUTER JOIN
        question_likes ON questions.id = question_id
      WHERE
        questions.author_id = ?
    SQL

    data.first.to_a.last.last
  end



end

# questions (title, body, author_id)

class Question
  attr_accessor :title, :body
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map {|datum| Question.new(datum)}
  end

  def self.find_by_id(target)
    data = QuestionsDatabase.instance.execute(<<-SQL, target)
    SELECT
      *
    FROM
      questions
    WHERE
      id = ?
    SQL

    raise 'Nothing found!' if data.empty?
    Question.new(data.first)
  end

  def self.find_by_author_id(author_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT
      *
    FROM
      questions
    WHERE
      author_id = ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body']
    @author_id = options['author_id']
  end

  def save
    if @id
      update
    else
      create
    end
  end

  def create
    raise 'Already exists in DB' if @id
    data = QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id)
      INSERT INTO
        questions (title, body, author_id)
      Values
        (?, ?, ?)

        SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
  end

  Question.new("title" => 'Can''t save', "body" => 'My Database is static', "author_id" => 5)

  def update
  raise 'does not exist in DB' unless @id
  data = QuestionsDatabase.instance.execute(<<-SQL, @title, @body, @author_id, @id)
    UPDATE
      questions
    SET
      title = ?, body = ?, author_id = ?
    WHERE
      id = ?
    SQL
  end

  def author
    User.find_by_id(@author_id)
  end

  def replies
    Reply.find_by_question_id(@id)
  end

  def followers
    QuestionFollow.followers_for_question_id(@id)
  end

  def num_likes
    Like.num_likes_for_question_id(@id)
  end

  def likers
    Like.likers_for_question_id(@id)
  end

  def self.most_followed(n)
    QuestionFollow.most_followed_questions(n)
  end

  def self.most_liked(n)
    Like.most_liked_questions(n)
  end

end

#question_follows (user_id, question_id)

class QuestionFollow
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
    data.map {|datum| QuestionFollow.new(datum)}
  end

  def self.find_by_id(target)
    data = QuestionsDatabase.instance.execute(<<-SQL, target)
    SELECT
      *
    FROM
      question_follows
    WHERE
      id = ?
    SQL

    raise 'Nothing found!' if data.empty?
    QuestionFollow.new(data.first)
  end


  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end

  def self.followers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      users.id, users.fname, users.lname
    FROM
      question_follows
    JOIN users ON user_id = users.id
    WHERE question_id = ?
    SQL
    data.map {|datum| User.new(datum)}
  end

  def self.followed_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      questions.id, questions.title, questions.body, questions.author_id
    FROM
      question_follows
    JOIN questions ON question_id = questions.id
    WHERE user_id = ?
    SQL
    data.map {|datum| Question.new(datum)}
  end

  def self.most_followed_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      questions.id, questions.title, questions.body, questions.author_id, COUNT(questions.id) AS count
    FROM
      question_follows
    JOIN questions ON question_id = questions.id
    GROUP BY
      questions.id
    HAVING
      COUNT(questions.id)
    ORDER BY
      count desc
    LIMIT
      ?
    SQL

    data.map {|datum| Question.new(datum)}
  end
end

#replies (question_id, parent_reply_id, reply_author_id, body)

class Reply
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM replies")
    data.map {|datum| Reply.new(datum)}
  end

  def self.find_by_id(target)
    data = QuestionsDatabase.instance.execute(<<-SQL, target)
    SELECT
      *
    FROM
      replies
    WHERE
      id = ?
    SQL

    raise 'Nothing found!' if data.empty?
    Reply.new(data.first)
  end

  def self.find_by_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      *
    FROM
      replies
    WHERE
      reply_author_id = ?
    SQL
    data.map {|datum| Reply.new(datum)}
  end

  def self.find_by_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      *
    FROM
      replies
    WHERE
      question_id = ?
    SQL
    data.map {|datum| Reply.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @question_id = options['question_id']
    @parent_reply_id = options['parent_reply_id']
    @reply_author_id = options['reply_author_id']
    @body = options['body']
  end

  def author
    User.find_by_id(@reply_author_id)
  end

  def question
    Question.find_by_id(@question_id)
  end

  def parent_reply
    Reply.find_by_id(@parent_reply_id)
  end

  def child_reply
    data = QuestionsDatabase.instance.execute(<<-SQL, @id)
    SELECT
      *
    FROM
      replies
    WHERE
      parent_reply_id = ?
    SQL
    Reply.new(data.last)
  end

end

#question_likes (user_id, question_id)

class Like
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
    data.map {|datum| Like.new(datum)}
  end

  def self.likers_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      *
    FROM
      question_likes
    JOIN users ON user_id = users.id
    WHERE
      question_id = ?
    SQL

    data.map {|datum| User.new(datum)}
  end


  def self.num_likes_for_question_id(question_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    SELECT
      COUNT(id)
    FROM
      question_likes
    WHERE
      question_id = ?
    SQL

    data.first.to_a.last.last
  end

  def self.liked_questions_for_user_id(user_id)
    data = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    SELECT
      *
    FROM
      question_likes
    JOIN
      questions ON question_id = questions.id
    WHERE
      user_id = ?
    SQL

    data.map {|datum| Question.new(datum)}
  end


  def self.find_by_id(target)
    data = QuestionsDatabase.instance.execute(<<-SQL, target)
    SELECT
      *
    FROM
      question_likes
    WHERE
      id = ?
    SQL

    raise 'Nothing found!' if data.empty?
    Like.new(data.first)
  end

  def self.most_liked_questions(n)
    data = QuestionsDatabase.instance.execute(<<-SQL, n)
    SELECT
      *, COUNT(question_likes.id) AS count
    FROM
      question_likes
    JOIN questions ON question_id = questions.id
    GROUP BY
      questions.id
    HAVING
      COUNT(question_likes.id)
    ORDER BY
      count desc
    LIMIT
      ?
    SQL

    data.map {|datum| Question.new(datum)}
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
