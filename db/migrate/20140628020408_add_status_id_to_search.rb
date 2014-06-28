class AddStatusIdToSearch < ActiveRecord::Migration
  def change
    add_column :searches, :status_id, :integer

    add_index :searches, :status_id
  end
end
