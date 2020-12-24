require 'rails_helper'

RSpec.describe Experiment, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :code_reference }
    it { should validate_presence_of :wrapper }
  end

  describe 'Relations' do
    it { should belong_to :user }
  end
end
