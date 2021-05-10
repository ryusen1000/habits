require 'rails_helper'
RSpec.describe Motion, type: :model do
  before do
    task = FactoryBot.create(:task)
    @motion = FactoryBot.build(:motion, task_id: task.id)
  end

  describe "行動の登録" do
    context "行動の登録ができる" do
      it "全て条件通りの入力をすると新規登録できる" do
        expect(@motion).to be_valid
      end
    end
    
    context "タスク登録できない" do
      it "actが入力されていないと登録できない" do
        @motion.act = ""
        @motion.valid?
        expect(@motion.errors.full_messages).to include("Act can't be blank")
      end
      it "amountが入力されていないと登録できない" do
        @motion.amount = ""
        @motion.valid?
        expect(@motion.errors.full_messages).to include("Amount can't be blank")
      end
      it "if_actが入力されていないと登録できない" do
        @motion.if_act = ""
        @motion.valid?
        expect(@motion.errors.full_messages).to include("If act can't be blank")
      end
      it "actが入力されていないと登録できない" do
        @motion.if_amount = ""
        @motion.valid?
        expect(@motion.errors.full_messages).to include("If amount can't be blank")
      end
      it "taskが紐づいていないと登録できない" do
        @motion.task_id = ""
        @motion.valid?
        expect(@motion.errors.full_messages).to include("Task can't be blank")
      end
    end
  end
end
