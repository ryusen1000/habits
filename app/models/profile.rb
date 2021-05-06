class Profile < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :age, :weight, :user_id
  end
end
