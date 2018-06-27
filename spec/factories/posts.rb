FactoryBot.define do
  factory :post do
    title { FFaker::Book.title }
    content { FFaker::Lorem.paragraph }
    user_id { User.last&.id || FactoryBot.create(:user).id }
    after(:build) do |post|
      post.header_image.attach(io: File.open(Rails.root.join('public', 'apple-touch-icon.png')), filename: 'apple-touch-icon.png', content_type: 'image/png')
    end

    factory :invalid_post do
      title nil
    end
  end
end
