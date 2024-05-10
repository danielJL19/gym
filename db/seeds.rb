# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

(22..122).each do |i|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.unique.email(name: Faker::Name.first_name, domain: 'hotmail.com'),
    birthdate: Faker::Date.between(from: '1997-01-01', to: '2012-01-01'),
    password: 'abc.123',
    password_confirmation: 'abc.123'
  )
end
