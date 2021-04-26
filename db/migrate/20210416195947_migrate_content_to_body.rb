class MigrateContentToBody < ActiveRecord::Migration[6.0]
  def up
    Post.all.each do |post|
      post.update_attribute(:body, ApplicationController.helpers.parse_content(post.content))
    end
  end

  def down
    Post.all.each do |post|
      post.update_attribute(:content, post.body.to_s)
    end
  end
end
