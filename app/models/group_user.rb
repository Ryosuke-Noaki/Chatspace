class GroupUser < ApplicationRecord
  belongs_to :user
  belongs_to :group
  validates :user_id, :group_id, numericality: true, presence: true
end