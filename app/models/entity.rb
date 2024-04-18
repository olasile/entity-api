class Entity < ApplicationRecord
  has_many :entity_fields, as: :entity_fieldable, class_name: 'Entity::Field', dependent: :destroy
  has_many :entity_records, class_name: 'Entity::Record', dependent: :destroy

  validates :name, presence: true
end