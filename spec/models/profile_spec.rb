require 'rails_helper'
RSpec.describe Profile, type: :model do
  before do
    user = FactoryBot.create(:user)
    @profile = FactoryBot.build(:profile, user_id: user.id)
  end

  describe "プロフィール登録" do
    context "プロフィール登録できる" do
      it "全て条件通りの入力をすると新規登録できる" do
        expect(@profile).to be_valid
      end
    end
    
    context "タスク登録できない" do
      it "ageが入力されていないと登録できない" do
        @profile.age = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Age can't be blank")
      end
      it "weightが入力されていないと登録できない" do
        @profile.weight = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("Weight can't be blank")
      end
      it "Userが紐づいていないと登録できない" do
        @profile.user_id = ""
        @profile.valid?
        expect(@profile.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
