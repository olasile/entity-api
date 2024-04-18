class CreateEntityValues < ActiveRecord::Migration[6.0]
  def change
    create_table :entity_values do |t|
      t.references :entity_field, null: false, foreign_key: true
      t.text :value
    end
  end
end
