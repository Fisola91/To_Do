# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all

User.create(name: "John", email: "john@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name: "Peter", email: "peter@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name: "Paul", email: "paul@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name: "Jerry", email: "jerry@gmail.com", password: "123456", password_confirmation: "123456")
User.create(name: "Monday", email: "monday@gmail.com", password: "123456", password_confirmation: "123456")