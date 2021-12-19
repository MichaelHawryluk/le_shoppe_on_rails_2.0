# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

Page.delete_all
Product.delete_all

filename = Rails.root.join("db/products.csv")

csv_data = File.read(filename)

products = CSV.parse(csv_data, headers: true, encoding: "utf-8")

# create table Brands with name and associated short-url
products.each do |p|
  product = Product.create(
    name:          p["name"],
    description:   p["description"],
    price:         p["price"],
    product_stock: p["product_stock"]
  )
end

Page.create(
  title: 'About the dataset',
  content: 'the dataset comes from a public github repository, has a anumber of different available products, mostly electronics.',
  permalink: 'about_the_dataset'
)

Page.create(
  title: 'Contact Us',
  content: 'If you have any issues or suggestions feel free to reach out to us @leshoppe@mb.ca.',
  permalink: 'contact'
)

# products.each do |p|
# puts "\nProduct: " + p["name"] +
#       "\nDescription: " + p["description"] +
#       "\nPrice: " + p["price"] +
#       "\nProduct Stock " + p["product_stock"] +
#       "\nProduct Status ID: " + p["product_status_id"]
# end

 puts "Created #{Page.count} pages."
