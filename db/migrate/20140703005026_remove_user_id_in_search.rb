class RemoveUserIdInSearch < ActiveRecord::Migration
  def up
  	remove_column :searches, :user_id
  end

  def down
  	add_column :searches, :user_id
  end
end
