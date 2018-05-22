FactoryBot.define do
  factory :post do
    title { FFaker::Book.title }
    content { FFaker::Lorem.paragraphs }
    user_id { User.last&.id || FactoryBot.create(:user).id }

    factory :invalid_post do
      title nil
    end
  end
end
