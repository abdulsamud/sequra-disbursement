# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'json'

# Distroy all data before create
Order.destroy_all
Merchant.destroy_all
Shopper.destroy_all

# Load json files
merchants_file = File.read(Rails.root.join('./lib/merchants.json'))
shoppers_file = File.read(Rails.root.join('./lib/shoppers.json'))
orders_file = File.read(Rails.root.join('./lib/orders.json'))

# Parse file Records to ready to create
merchants = JSON.parse(merchants_file)['RECORDS']
shoppers = JSON.parse(shoppers_file)['RECORDS']
orders = JSON.parse(orders_file)['RECORDS']

# Creating Merchants
merchants.each do |merchant|
  Merchant.create(name: merchant['name'], email: merchant['email'], cif: merchant['cif'])
end

# Creating Shoppers
shoppers.each do |shopper|
  Shopper.create(name: shopper['name'], email: shopper['email'], nif: shopper['nif'])
end

# Creating Orders
orders.each do |order|
  completed_at = order['completed_at'].present? ? DateTime.parse(order['completed_at']) : nil
  Order.create(amount: order['amount'].to_f, completed_at: completed_at,
                merchant_id: order['merchant_id'].to_i, shopper_id: order['shopper_id'].to_i)
end
