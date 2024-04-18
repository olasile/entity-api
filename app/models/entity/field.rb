class Entity::Field < ApplicationRecord
  belongs_to :entity_fieldable, polymorphic: true

  validates :label, presence: true
end
