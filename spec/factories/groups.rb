# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :group do
    name Faker::Team.name
  end
    after(:create) do |group|
      create(:user, groups: [group])
    end
end
