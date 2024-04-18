class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  include DeviseTokenAuth::Concerns::User

  has_many :entity_favourites, class_name: 'Entity::Favourite', dependent: :destroy
end
