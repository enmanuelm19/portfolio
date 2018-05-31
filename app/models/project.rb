class Project < ApplicationRecord
  belongs_to :user
  validates :title, :user, presence: true

  scope :published_projects, -> { where(published: true) }
end
