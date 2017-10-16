# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
DefinedWords.destroy_all


20.times do {
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::RickAndMorty.character, gender: ["Male", "Female"].sample, email: Faker::Internet.unique.email, password: "booboo", dob: Faker::Date.birthday(18, 65))
}

200.times do {
  DefinedWords.create(word: Faker::SiliconValley.company, definition: Faker::SiliconValley.quote,user: User.all.sample, origin: Origin.all.sample, example: Faker::RickAndMorty.quote)
}
