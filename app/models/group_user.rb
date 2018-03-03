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

class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :user_id, :group_id, numericality: { only_integer: true }, presence: true
end
