class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable

  enum role: [:user, :manager, :admin]

  has_one :profile, dependent: :destroy
  has_many :time_records, dependent: :destroy

  after_create do |user|
    user.create_profile! unless user.profile.present?
  end

  def display_name
    profile&.full_name.present? ? profile.full_name : email
  end
end
