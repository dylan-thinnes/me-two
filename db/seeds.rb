# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a1 = Article.create!(title: "Article 1", blurb: "a1", content: "This is art1", published: false)
a2 = Article.create!(title: "Article 2", blurb: "a2", content: "This is art2", published: true)
a3 = Article.create!(title: "Article 3", blurb: "a3", content: "This is art3", published: true)

p1 = Project.create!(name: "Project 1", link: "https://github.com", content: "proj1")
p1 = Project.create!(name: "Project 2", link: "https://github.com", content: "proj2")
