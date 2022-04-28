# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "user@example.com", name:'Joan', password: "password", password_confirmation: "password")
User.create(email: "user6@example.com", name: 'Man', password: "password", password_confirmation: "password")



10.times do |x|
    Post.create(tittle: "Title #{x}", body: "body #{x} ahora si", user_id: User.first.id)
end