class Tagging < ApplicationRecord
  validates :todo_id, :tag_id, presence: true

  belongs_to :todo
  belongs_to :tag

end
