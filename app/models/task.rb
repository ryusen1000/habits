class Task < ApplicationRecord
  belongs_to :user
  has_many :motions, dependent: :destroy
  with_options presence: true do
    validates :theme, :goal, :user_id
  end
end
