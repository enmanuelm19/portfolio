class Experiment < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  paginates_per 10
  belongs_to :user
  has_one_attached :header_image
  validates :title, :user_id, :code_reference, :wrapper, presence: true
  scope :published_experiments, -> { where(published: true) }
  scope :unpublished_experiments, -> { where.not(published: true) }
end
