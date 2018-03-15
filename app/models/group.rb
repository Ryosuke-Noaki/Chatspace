# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Group < ApplicationRecord
  has_many :messages
  has_many :group_users
  has_many :users, through: :group_users

  validates :name, presence: true, uniqueness: true

  def associate_users(user_ids:)
    user_ids.each do |user_id|
      self.users << User.where(id: user_ids)
    end
  end

  def error_message_num
    self.errors.full_messages.count
  end

  def error_messages
    self.errors.full_messages
  end

end



