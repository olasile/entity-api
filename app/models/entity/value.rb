class Entity::Value < ApplicationRecord
  belongs_to :entity_field, class_name: 'Entity::Field'
  belongs_to :entity_record, class_name: 'Entity::Record'

  validates :value, presence: true
end
