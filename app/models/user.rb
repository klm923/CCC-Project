class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  has_many :claims, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_claims, through: :likes, source: :claim

  def already_liked?(claim)
    self.likes.exists?(claim_id: claim.id)
  end
  
  validates :name, presence: true 
  validates :profile, length: { maximum: 200 } 

  has_many :questions, dependent: :destroy
end
