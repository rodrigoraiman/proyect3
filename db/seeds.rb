# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: "user@example.com", password: "password", password_confirmation: "password", name:'Joan', role: User.roles[:admin])

User.create(email: "user8@example.com", password: "password", password_confirmation: "password", name:'Yojan doe', role: User.roles[:user])

category =  Category.first_or_create!(name:"Uncategorized", display_in_nav: true)
Category.first_or_create!(name:"Carpintero", display_in_nav: false)
Category.first_or_create!(name:"Arquitecto", display_in_nav: true)
Category.first_or_create!(name:"Albañil", display_in_nav: true)

10.times do |x|
    puts "Creando Post #{x}"
    post = Post.create(tittle: "Title #{x}",
                    body: "body #{x} Words go here",
                    user_id: User.first.id, 
                    category: category)

    5.times do |y|
        Comment.create(body: "Comment #{y}", user_id: User.second.id, post_id: post.id)
    end
end



