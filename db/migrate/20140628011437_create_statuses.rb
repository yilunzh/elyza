class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :name

      t.timestamps
    end

    create_table :searches_statuses, id: false do |t|
    	t.belongs_to :search
    	t.belongs_to :status
    end
  end
end
