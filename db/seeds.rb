# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Review.create(name: "Matcha Mochi Donut", photo: "example.png", description: "Donuts made with Mochi", dairy_free: nil, gluten_free: 0, halal: 0, kosher: 0, nut_free: 0, vegan: 0, vegetarian: 0, likes: 23, dislikes: 1, lat: "39.675827212143645", lng: "-104.8654249015717") 
Review.create(name: "Flu Shot Pho", photo: "something.jpeg", description: "Pho with lemongrass, lime, and chili broth", dairy_free: 0, gluten_free: 0, halal: 0, kosher: 0, nut_free: 0, vegan: 0, vegetarian: 0, likes: 412, dislikes: 45, lat: "39.6880903110667", lng: "-104.94002900531989") 
