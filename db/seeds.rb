# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Studio.destroy_all
Cast.destroy_all
Actor.destroy_all
Movie.destroy_all

FactoryBot.create_list(:studio, 5)

5.times do
  Studio.all.each do |studio|
    studio.movies.create(title: Faker::Movie.title, creation_year: Faker::Number.between(from: 1912, to: 2020))
  end
end