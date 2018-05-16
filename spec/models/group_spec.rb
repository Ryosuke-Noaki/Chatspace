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
    context 'can save' do
      let(:group) { build(:group) }
      it 'is valid with name' do
        group = build(:group, name: Faker::Team.name)
      end
    end

    context 'can not save' do
      it 'is invalid with name' do
        group = build(:group, name: nil)
        group.valid?
        expect(group.errors[:name]).to include('を入力してください')
      end

      it 'is invalid with name' do
        group = build(:group, name: "")
        group.valid?
        expect(group.errors[:name]).to include('を入力してください')
      end
    end
  end
end
