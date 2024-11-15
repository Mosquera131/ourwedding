class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :confirmable,  :rememberable
  enum rol: { engaged: "engadged", guest: "guest", organizer: "organizer" }

  has_many :events

  # validaciones
  validates :name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
