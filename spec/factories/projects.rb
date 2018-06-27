FactoryBot.define do
  factory :project do
    title { FFaker::Book.title }
    description { FFaker::Lorem.paragraph }
    user_id { User.last&.id || FactoryBot.create(:user).id }
    published true
    locale 'es'

    factory :invalid_project do
      title nil
    end

    factory :unpublished_project do
      published false
    end
  end
end
