class AddResultsToSearch < ActiveRecord::Migration
  def up
  	add_column :searches, :results, :hstore
  end

  def down
  	remove_column :searches, :results
  end
end
