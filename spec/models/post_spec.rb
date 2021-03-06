require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :content }
    it { should validate_presence_of :user_id }
  end

  describe 'Relations' do
    it { should belong_to :user }
  end
end
