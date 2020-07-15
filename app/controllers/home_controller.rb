class HomeController < ApplicationController
  before_action :set_og_properties

  def index
    @message =  Message.new
  end

  private

    def set_og_properties
      @og_properties = {
        title: @meta_title || ApplicationController::BRAND_NAME,
        type: 'website',
        image: 'https://i.imgur.com/kNvim2y.jpg',
        url: 'https://enmanuelmedina.com'
      }
    end
end
