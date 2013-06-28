class CreateBeers < ActiveRecord::Migration
  def up
    create_table :beers do |t|
      t.string :beer_name,    :limit => 50
      t.string :beer_type,    :limit => 100
      t.text :history
      t.string :flavor_prof
      t.timestamps
    end
  end
  
  def down
    drop_table :beers
  end
end
