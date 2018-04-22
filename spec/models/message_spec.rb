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
require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    let(:message) {build(:message)}
    context 'can save' do
      it 'is valid with body' do
        expect(build(:message, image: nil)).to be_valid
      end

      it 'is valid with body' do
        expect(build(:message, image: "")).to be_valid
      end

      it 'is valid with image' do
        expect(build(:message, body: nil)).to be_valid
      end

      it 'is valid with image' do
        expect(build(:message, body: "")).to be_valid
      end

      it 'is valid with body and image' do
        expect(message).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid without content and image' do
        message = build(:message, body: nil, image: nil)
        message.valid?
        expect(message.errors[:body_or_image]).to include('を入力してください')
      end

      it 'is invalid without content and image' do
        message = build(:message, body: nil, image: "")
        message.valid?
        expect(message.errors[:body_or_image]).to include('を入力してください')
      end


      it 'is invalid without group_id' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include('を入力してください')
      end

      it 'is invalid without group_id' do
        message = build(:message, group_id: "")
        message.valid?
        expect(message.errors[:group]).to include('を入力してください')
      end

      it 'is invaid without user_id' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include('を入力してください')
      end

      it 'is invaid without user_id' do
        message = build(:message, user_id: "")
        message.valid?
        expect(message.errors[:user]).to include('を入力してください')
      end
    end
  end
end
