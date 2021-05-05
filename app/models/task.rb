class Task < ApplicationRecord
  belongs_to :user
  
  validates :theme, presence: true
  validates :goal,  presence: true
end
