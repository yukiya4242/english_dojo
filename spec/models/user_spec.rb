require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it '有効な属性であれば有効' do
      user = build(:user)
      expect(user).to be_valid
    end

    it '名前がなければ無効であるべき' do
      user = build(:user, username: nil)
      expect(user).to_not be_valid
    end

    it 'メールがなければ無効であるべき' do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end


  end
end

