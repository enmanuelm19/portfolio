require 'rails_helper'

RSpec.describe Message do
  it 'has attributes' do
    expect(Message.new).respond_to? :name
    expect(Message.new).respond_to? :body
    expect(Message.new).respond_to? :email
  end

  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :body }
    it { should validate_presence_of :email }
  end
end
