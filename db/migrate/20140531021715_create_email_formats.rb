class CreateEmailFormats < ActiveRecord::Migration
  def change
    create_table :email_formats do |t|
      t.string :format

      t.timestamps
    end
  end
end
