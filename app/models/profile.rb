class Profile < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    with_options format: { with: /\A[0-9]+\z/ } do
      validates :age, :weight, :user_id
    end
  end
end
