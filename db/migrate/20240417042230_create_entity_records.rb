class CreateEntityRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :entity_records do |t|
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end

    add_reference :entity_values, :entity_record, null: false, foreign_key: true
  end
end
