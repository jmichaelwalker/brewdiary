class CreateIngredients < ActiveRecord::Migration
  def up
    create table "ingredients" do |t|
      t.string "ing_name"
      t.string "ing_type",  :limit => 25
      t.string "color",     :limit => 25
      t.string "flav_prof"
      t.string "other"
      t.string "srm_ibu",   :limit => 25
      t.string "image_url"
      t.timestamps
    end
  end
  
  def down
    drop_table "ingredients"
  end
end

