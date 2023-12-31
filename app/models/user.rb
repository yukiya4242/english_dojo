class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates :username,  presence: true
  validates :email, presence: true

  has_many :scores

  has_one_attached :profile_image

  def total_score
    scores.sum(:point)
  end

end
