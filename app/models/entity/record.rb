class Entity::Record < ApplicationRecord
  has_many :entity_values, class_name: 'Entity::Value', dependent: :destroy, foreign_key: 'entity_record_id'

  belongs_to :entity

  def entity_fields
    Entity::Field.where(id: entity_values.map(&:entity_field_id))
  end
end