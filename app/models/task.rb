class Task < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :theme, :goal, :user_id
  end
end
