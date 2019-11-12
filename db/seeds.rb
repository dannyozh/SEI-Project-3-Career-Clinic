# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trait.create!(personality: "Realistic")
Trait.create!(personality: "Artistic")
Trait.create!(personality: "Investigative")
Trait.create!(personality: "Social")
Trait.create!(personality: "Enterprising")
Trait.create!(personality: "Conventional")

Environment.create!(choice: "Field Work")
Environment.create!(choice: "Office")
Environment.create!(choice: "Individual")
Environment.create!(choice: "Small Team")
Environment.create!(choice: "Big Team")
Environment.create!(choice: "Fixed Hours")
Environment.create!(choice: "Flexible Hours")

Industry.create!(name: "Architecture")
Industry.create!(name: "Construction")
Industry.create!(name: "Technology")
Industry.create!(name: "Movie & Theatre")
Industry.create!(name: "Music & Media")
Industry.create!(name: "Art & Design")
Industry.create!(name: "Manufacturing")
Industry.create!(name: "Environment")
Industry.create!(name: "Healthcare")
Industry.create!(name: "Wellness")
Industry.create!(name: "Fashion")
Industry.create!(name: "Hospitality")
Industry.create!(name: "Travel")
Industry.create!(name: "Finance")
Industry.create!(name: "Government")
Industry.create!(name: "Transportation")
Industry.create!(name: "Telecommunications")
