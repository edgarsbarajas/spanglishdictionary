# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
DefinedWord.destroy_all
Comment.destroy_all
Vote.destroy_all
Origin.destroy_all


5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::RickAndMorty.character, gender: ["Male", "Female"].sample, email: Faker::Internet.unique.email, password: "booboo", dob: Faker::Date.birthday(18, 65))
end

10.times do
  DefinedWord.create(word: Faker::Hipster.word, definition: Faker::Hacker.say_something_smart, user: User.all.sample, origin: Origin.all.sample, example: Faker::RickAndMorty.quote)
end


countries = ['Argentina', 'Bolivia', 'Chile', 'Colombia', 'Costa Rica',
             'Cuba', 'Dominican Republic', 'Ecuador', 'El Salvador',
              'Equatorial Guinea', 'Guatemala', 'Honduras', 'Mexico',
              'Nicaragua', 'Panama', 'Paraguay', 'Peru', 'Spain', 'Uruguay',
              'Venezuela']

countries.each do |country|
  Origin.create(country: country)
end


