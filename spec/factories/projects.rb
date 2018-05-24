FactoryBot.define do
  factory :project do
    title { FFaker::Book.title }
    description { FFaker::Lorem.paragraph }
    user_id { User.last&.id || FactoryBot.create(:user).id }

    factory :invalid_project do
      title nil
    end
  end
end
