class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :first_name
      t.string :last_name
      t.string :domain_name

      t.timestamps
    end
  end
end
