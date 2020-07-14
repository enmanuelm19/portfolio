require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  it 'creates a message' do
    post :create, params: { message: { name: 'Nombre', email: 'mail@mail.com', body: 'Mensaje '}}
    expect(subject).to redirect_to root_path(anchor: 'contacto')
  end

  it 'does not create a message' do
    post :create, params: { message: { name: '', email: '', body: ''}}
    expect(response).to render_template('home/index')
  end
end
