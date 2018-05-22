class Post < ApplicationRecord
  validates :title, :content, :user_id, presence: true
end
