require 'rails_helper'

RSpec.describe 'Post module', js: true do
  feature 'Show list of posts' do
    scenario 'user goes to post list' do
      visit posts_path
      expect(page).to have_content(I18n.t('activerecord.models.post.other'))
    end
  end

  feature 'Show specific post' do
    scenario 'user goes to specific post' do
      post = FactoryBot.create(:post)
      visit post_path(id: post.id)
      expect(page).to have_text(post.title)
    end
  end
end

