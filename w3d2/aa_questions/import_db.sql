CREATE TABLE users (
id INTEGER PRIMARY KEY,
fname TEXT NOT NULL,
lname TEXT NOT NULL

);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  reply_author_id INTEGER NOT NULL,
  body TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (reply_author_id) REFERENCES user(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Joe', 'Smith'),
  ('Sara', 'Questions'),
  ('Rob', 'Tables');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('JOINS in SQL?', 'I don''t understand', 1),
  ('Chess implementation', 'I don''t get singleton', 1);

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 2);

INSERT INTO
  replies (question_id, parent_reply_id, reply_author_id, body)
VALUES
  (1, NULL, 3, 'I don''t get it either'),
  (1, 1, 1, 'OH MY GOSH, good thing it''s not just me');

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  (3, 1),
  (2, 1),
  (2, 2);
