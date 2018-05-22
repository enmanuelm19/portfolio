FactoryBot.define do
  factory :user do
    email { FFaker::Internet.free_email }
    password { 'password' }
    password_confirmation { 'password' }

    factory :invalid_user do
      email nil
    end
  end
end
