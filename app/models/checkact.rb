class Checkact < ApplicationRecord
  belongs_to :motion
  validates :completion, :motion_id, presence: true
end
