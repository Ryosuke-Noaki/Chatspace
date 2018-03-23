# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text(65535)
#  image      :string(255)
#  group_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  belongs_to :group
  belongs_to :user

  validates :group_id, :user_id, presence: true, numericality: {only_integer: true}
  validates :body_or_image

  private

  def body_or_image
    body.presence || image.presence
  end

end
