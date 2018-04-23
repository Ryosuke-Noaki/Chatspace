# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  image      :string(255)      default(""), not null
#  group_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :message do
    body {Faker::Lorem.sentence}
    association :user, factory: :user
    association :group, factory: :group
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public', 'uemoto.jpg')) }
  end
end
