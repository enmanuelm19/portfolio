class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  paginates_per 10
  belongs_to :user
  has_one_attached :header_image
  validates :title, :content, :user_id, presence: true

  scope :published_posts, -> { where(published: true) }
  scope :unpublished_posts, -> { where.not(published: true) }
end
