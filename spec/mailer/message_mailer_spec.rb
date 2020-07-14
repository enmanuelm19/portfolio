require 'rails_helper'

RSpec.describe MessageMailer, type: :mailer do
  describe 'contact_me' do
    let(:mail) { MessageMailer.contact_me(Message.new(name: 'Name', email: 'email@mail.com', body: 'Body')) }
    it 'renders the headers' do
      expect(mail.to).to eq(['enmanuelm19@gmail.com'])
    end

    it 'redners the body' do
      expect(mail.body.encoded).to have_content('Name')
    end
  end
end
