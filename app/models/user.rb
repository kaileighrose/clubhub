require 'pry'
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :omniauthable, :omniauth_providers => [:facebook]
  has_and_belongs_to_many :teams
  has_many :meetings, through: :teams
  has_many :notes, through: :meetings
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid.to_s).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name  
      user.provider = auth.provider
      user.uid = auth.uid
    end
  end
end
