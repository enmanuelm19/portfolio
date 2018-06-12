class Project < ApplicationRecord
  paginates_per 10
  belongs_to :user
  has_one_attached :header_image
  validates :title, :user, presence: true
  enum locale: %i[es en]

  scope :published_projects, -> { where(published: true) }
  scope :unpublished, -> { where.not(published: true) }
end
