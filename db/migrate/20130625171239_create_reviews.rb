class CreateReviews < ActiveRecord::Migration
  def up
    create_table :reviews do |t|
      t.string :review_title
      t.integer :member_id
      t.integer :beer_recipes_id
      t.timestamps
    end
  end

  def down
    drop_table :reviews
  end
end

