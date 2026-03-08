require_relative './product'
require_relative './price_modifier'

if ARGV.length < 3
  puts "Usage: ruby runner.rb <name> <price>"
  exit
end

quantity_product = ARGV[0]
product_name = ARGV[1]
base_price = ARGV[2]

product = Product.new(product_name, base_price, modifier)
product.display
