class CreateEntityFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :entity_favourites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :entity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
