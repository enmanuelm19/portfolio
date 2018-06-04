class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.valid?
      MessageMailer.contact_me(@message).deliver_now
      redirect_to root_path(anchor: 'contacto'), notice: 'Gracias por contactarme, respondere a la brevedad posible.'
    else
      render 'home/index'
    end
  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :body)
    end
end
