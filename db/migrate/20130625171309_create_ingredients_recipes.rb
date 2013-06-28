class CreateIngredientsRecipes < ActiveRecord::Migration
  def up
    create_table :ingredients_recipes do |t|
      t.integer :beer_recipes_id
      t.integer :ingredients_id
      t.integer :equipment_id
      t.string :amount,       :limit => 50
      t.string :add_time,     :limit => 25
      t.timestamps
    end
  end
  
  def down
    drop_table :ingredients_recipes
  end
end
