class CreateMembers < ActiveRecord::Migration
  def up
    create_table "members" do |t|
      t.string "username",    :limit => 25
      t.string "password",    :limit => 25
      t.string "mem_type",    :limit => 25
      t.string "first_name",  :limit => 25
      t.string "last_name",   :limit => 25
      t.string "email"
      t.string "other"
      t.string "reviews"
      t.timestamps
    end
  end
  
  def down
    drop_table "members"
  end
end
