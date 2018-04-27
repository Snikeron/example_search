# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

products = [
    {
        name: "Bread",
        description: "It's a simple carb.",
        price: 500
    },
    {
        name: "Bananas",
        description: "Lots of magnesium packed into a tube.",
        price: 350
    },
    {
        name: "Canned Tuna",
        description: "Responsibly sourced meat in a can.",
        price: 200
    },
    {
        name: "Chocolate Bar",
        description: "Fatty fat fat fat fatty fat.",
        price: 400
    },
    {
        name: "Gummy Bears",
        description: "Keep chewing away, lose them teeth.",
        price: 500
    },
    {
        name: "Microwaveable Buffalo Wings",
        description: "Great for a night out. At home.",
        price: 1500
    },
    {
        name: "Chicken Stock",
        description: "Whip up a great meal with the power of the cube.",
        price: 650
    },
    {
        name: "Beef Stock",
        description: "Beefy beef beef. Great for sauces.",
        price: 650
    },
    {
        name: "Vegetable Stock",
        description: "Vegetarians have great taste. Bless 'em.'",
        price: 650
    },
    {
        name: "Pork Sausages",
        description: "Chuck 'em on the barbie.",
        price: 1000
    }
]

Product.create!(products) { |product| p product.name }