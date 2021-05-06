require 'rails_helper'
RSpec.describe Task, type: :model do
  before do
    user = FactoryBot.create(:user)
    @task = FactoryBot.build(:task, user_id: user.id)
  end

  describe "タスク登録" do
    context "タスク登録できる" do
      it "全て条件通りの入力をすると新規登録できる" do
        expect(@task).to be_valid
      end
    end
    
    context "タスク登録できない" do
      it "themeが入力されていないと登録できない" do
        @task.theme = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("Theme can't be blank")
      end
      it "goalが入力されていないと登録できない" do
        @task.goal = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("Goal can't be blank")
      end
      it "Userが紐づいていないと登録できない" do
        @task.user_id = ""
        @task.valid?
        expect(@task.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
