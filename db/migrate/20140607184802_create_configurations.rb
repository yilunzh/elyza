class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.integer :score

      t.belongs_to :domain
      t.belongs_to :email_format
      t.timestamps
    end
  end
end
