class Entity::Favourite < ApplicationRecord
  belongs_to :entity
  belongs_to :user
end