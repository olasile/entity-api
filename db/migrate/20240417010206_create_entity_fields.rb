class CreateEntityFields < ActiveRecord::Migration[6.0]
  def change
    create_table :entity_fields do |t|
      t.references :entity_fieldable, polymorphic: true, index: { name: 'index_ef_on_efable_type_and_id' }
      t.string :label
    end
  end
end
