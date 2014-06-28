# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first
 require 'pry'

 def associate_email_formats_with_domain(domain)
 	EmailFormat.all.each do |format|
 		domain.email_formats << format
 		domain.configurations.each do |config|
			config.score = 0
		end
		
	end
end

EmailFormat.create(format: "(fn).(ln)")
EmailFormat.create(format: "(fn)_(ln)")
EmailFormat.create(format: "(fnfl)(ln)")
EmailFormat.create(format: "(fn)")
EmailFormat.create(format: "(fn).(mi).(ln)")

Status.create(name: "confirmed")
Status.create(name: "possible")
Status.create(name: "suspect")
Status.create(name: "invalid")
Status.create(name: "internal error")