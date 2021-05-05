class Task < ApplicationRecord
  validates :theme, presence: true
  validates :goal,  presence: true
end
