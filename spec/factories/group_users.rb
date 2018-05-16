# == Schema Information
#
# Table name: group_users
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :group_user do
    user
    group
  end
end
