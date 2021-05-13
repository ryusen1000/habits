class Motion < ApplicationRecord
  belongs_to :task
  has_many :checkacts, dependent: :destroy
    validates :act, :if_act, :task_id, presence: true
    validates :amount, :if_amount, presence: true ,format: { with: /\A[0-9]+\z/ }
end
