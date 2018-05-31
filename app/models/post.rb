class Post < ApplicationRecord
  belongs_to :user
  validates :title, :content, :user_id, presence: true

  scope :published_posts, -> { where(published: true) }
end
