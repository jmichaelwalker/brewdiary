class CreateRecipes < ActiveRecord::Migration
  def up
    create_table  :recipes do |t|
      t.string :recipe_name,       :limit => 50
      t.string :recipe_type,       :limit => 50
      t.string :brew_date,         :limit => 50
      t.string :yeast_starter,     :limit => 5
      t.string :batch_size,        :limit => 50
      t.string :mash_time,         :limit => 10
      t.string :mash_temp,         :limit => 10
      t.string :mash_steps,        :limit => 50
      t.string :boil_time,         :limit => 50
      t.integer :pri_ferm_days,    :limit => 10
      t.string :pri_ferm_temp,     :limit => 10
      t.string :pri_ferm_notes
      t.integer :sec_ferm_days,    :limit => 10
      t.string :sec_ferm_temp,     :limit => 10
      t.string :sec_ferm_notes      
      t.integer :org_gravity,      :limit => 10
      t.integer :org_gravity_temp, :limit => 10
      t.integer :final_gravity,    :limit => 10
      t.integer :final_gravity_temp, :limit => 10
      t.string :ibu,                 :limit => 10
      t.string :color,               :limit => 10
      t.string :cooking_steps
      t.integer :taste_rating,       :limit => 50
      t.string :tasting_notes
      t.string :review
      t.timestamps
    end
  end
  
  def down
    drop_table :recipes
  end
end