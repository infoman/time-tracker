class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  enum role: [:user, :manager, :admin]

  has_one :profile

  after_create do |user|
    user.create_profile! unless user.profile.present?
  end
end
