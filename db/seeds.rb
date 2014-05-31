# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Domain.create(name: "google.com")
Domain.create(name: "dropbox.com")

EmailFormat.create(format: "(fn).(ln)")
EmailFormat.create(format: "(fn)_(ln)")
EmailFormat.create(format: "(fnfl)(ln)")
EmailFormat.create(format: "(fn)")

