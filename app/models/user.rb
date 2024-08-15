class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist


  has_many :forms, dependent: :destroy
  has_many :form_fields, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

end
