require 'rails_helper'

RSpec.describe 'User sign in feature', js: true do
  feature 'Users sign in' do
    let(:user) { FactoryBot.create(:user) }
   scenario 'with valid credentials' do
    sign_in_with(user.email, user.password)
    expect(page).to have_content(I18n.t('devise.sessions.signed_in'))
   end

   scenario 'with invalid credentials' do
     sign_in_with(user.email, 'wrong-password')
     expect(page).to have_content('')
   end
  end
end
