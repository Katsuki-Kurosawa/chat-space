FactoryGirl.define do

  factory :message do
    body              Faker::Base.regexify("[a-z]{10}")
    image             Rack::Test::UploadedFile.new Rails.root.join('public/uploads/twitter-icon-circle-logo-400x400.jpg')
    group_id          "3"
    user_id           "2"
  end

end
