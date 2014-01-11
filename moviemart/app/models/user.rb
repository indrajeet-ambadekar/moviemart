class User < ActiveRecord::Base
  has_many :viewers
	has_many :authentications
  has_many :movies, through: :reviews
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    def apply_omniauth(auth)
    	authentications.build(:provider => auth['provider'], :uid => auth['uid'])
    end

    def password_required?
    	(authentications.empty? || !password.blank?) && super
    end

    def email_required?
      (authentications.empty? || !email.blank?) && super
    end
end
