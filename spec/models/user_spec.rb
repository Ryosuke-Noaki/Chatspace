# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string(255)      default(""), not null
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'can save' do
      let(:user) { build(:user) }

      it 'is valid with email' do
        expect(user).to be_valid
      end

      it 'is valid with password' do
        expect(user).to be_valid
      end

      it 'is valid with name' do
        user = build(:user, email: Faker::Internet.free_email)
      end
    end

    context 'can not save' do
      let(:user) { build(:user) }
      it 'is invalid with empty email' do
        user = build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it 'is invalid with empty email' do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include('を入力してください')
      end

      it 'is invalid with empty password' do
        user = build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end

      it 'is invalid with empty password' do
        user = build(:user, password: "")
        user.valid?
        expect(user.errors[:password]).to include('を入力してください')
      end

      it 'is invalid if password and password_confirmation are not same' do
        user.password = Faker::Internet.password
        user.valid?
        expect(user.password_confirmation).not_to eq(user.password)
      end

      it 'is invalid without name' do
        user = build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
      end

      it 'is invalid without name' do
        user = build(:user, name: "")
        user.valid?
        expect(user.errors[:name]).to include('を入力してください')
      end
    end
  end

  describe '#update' do
    let(:user) { create(:user) }

    context 'can save' do
      it 'is valid with email and name' do
        expect(user.update(name: "テスト", email: "test@gmail.com")).to be true
      end
    end

    context 'can not save' do
      it 'is invalid with empty email' do
        expect(user.update(name: "テスト", email: nil)).to be false
      end

      it 'is invalid with empty email' do
        expect(user.update(name: "テスト", email: "")).to be false
      end

      it 'is invalid without name' do
        expect(user.update(name: nil, email: "test@gmail.com")).to be false
      end

      it 'is invalid without name' do
        expect(user.update(name: "", email: "test@gmail.com")).to be false
      end
    end
  end
end
