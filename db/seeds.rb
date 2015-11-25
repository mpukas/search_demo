# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

path = "#{Rails.root}/data.json"
data = JSON.parse(File.read(path))
data.each do |language|
  pl = ProgrammingLanguage.new(name: language["Name"])
  types = language["Type"].split(", ").map { |type| Type.where(name: type).first_or_create }
  pl.types = types
  authors = language["Designed by"].split(", ").map { |author| Author.where(name: author).first_or_create }
  pl.authors = authors
  pl.save
end
