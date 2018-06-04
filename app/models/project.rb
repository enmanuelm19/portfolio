class Project < ApplicationRecord
  paginates_per 10
  belongs_to :user
  validates :title, :user, presence: true

  scope :published_projects, -> { where(published: true) }
end
