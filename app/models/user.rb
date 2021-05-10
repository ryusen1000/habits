class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tasks
  has_many :profiles

  with_options presence: true do
    validates :nickname

    with_options format: { with: /\A([0-9].*[a-zA-Z]|[a-zA-Z].*[0-9])\z/i } do
      validates :password, :password_confirmation
    end
  end
end
