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

require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  describe '#create' do
    let(:user) { create(:user) }
    let(:group) { create(:group) }

    context 'can save' do
      it 'is valid with attributes' do
        group_user = build(:group_user, user: user, group: group)
        expect(group_user.valid?).to be true
      end

      it 'is valid with group_id and user_id' do
        group_user = build(:group_user, group_id: group.id, user_id: user.id)
        expect(group_user.valid?).to be true
      end
    end

    context 'can not save' do
      it 'is invalid without group_id' do
        group_user = build(:group_user, group_id: 'hoge')
        group_user.valid?
        expect(group_user.errors[:group_id]).to include('は数値で入力してください')
      end

      it 'is invalid without group_id' do
        group_user = build(:group_user, group_id: nil)
        group_user.valid?
        expect(group_user.errors[:group_id]).to include('は数値で入力してください')
      end

      it 'is invalid without group_id' do
        group_user = build(:group_user, group_id: '')
        group_user.valid?
        expect(group_user.errors[:group_id]).to include('は数値で入力してください')
      end

      it 'is invalid without user_id'do
        group_user = build(:group_user, user: user, group: group, user_id: 'fuga')
        group_user.valid?
        expect(group_user.errors[:user_id]).to include('は数値で入力してください')
      end

      it 'is invalid without user_id'do
        group_user = build(:group_user, user: user, group: group, user_id: nil)
        group_user.valid?
        expect(group_user.errors[:user_id]).to include('は数値で入力してください')
      end

      it 'is invalid without user_id'do
        group_user = build(:group_user, user: user, group: group, user_id: '')
        group_user.valid?
        expect(group_user.errors[:user_id]).to include('は数値で入力してください')
      end
    end
  end
end
