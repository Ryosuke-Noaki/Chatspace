# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Group,type: :model do
  describe '#create' do
    let(:group) { build(:group) }
    context 'can save' do
      it 'is valid with name' do
        group = build(:group, name: Faker::Team.name)
        expect(group).to be_valid
      end

      it 'confirms prepared users' do
        group = build(:group)
        users = create_list(:user, 10)
        user_ids = users.map {|user| user.id}
        group.associate_users(user_ids: user_ids)
        expect(group.users).to eq users
      end
    end

    context 'can not save' do
      it 'is invalid without name' do
        group.name = nil
        group.valid?
        expect(group.errors[:name]).to include('を入力してください')
      end

      it 'is invalid without name' do
        group = build(:group, name: "")
        group.valid?
        expect(group.errors[:name]).to include('を入力してください')
      end

      it 'is invalid with same name' do
        name = "test_group"
        create(:group, name: name)
        group = build(:group, name: name)
        group.valid?
        expect(group.errors[:name]).to include('はすでに存在します')
      end
    end
  end

  describe '#update' do
    let(:group) { create(:group) }
    context 'can save' do
      it 'is valid with name' do
        expect(group.update(name: "テスト")).to be true
      end
    end

    context 'can not save' do
      it 'is invalid without name' do
        build(:group)
        group.update(name: nil)
        group.valid?
        expect(group.errors[:name]).to include('を入力してください')
      end

      it 'is invalid without name' do
        build(:group)
        group.update(name: "")
        group.valid?
        expect(group.errors[:name]).to include('を入力してください')
      end
    end
  end
end
