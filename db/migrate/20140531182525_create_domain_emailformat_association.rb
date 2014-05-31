class CreateDomainEmailformatAssociation < ActiveRecord::Migration
  def change
    create_table :domains_email_formats do |t|
    	t.integer "domain_id"
    	t.integer "email_format_id"

    	t.timestamps
    end
  end
end
