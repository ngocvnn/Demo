class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :status_id, presence: true
  validates  :content, presence: true, length: {maximum: 255}

end
