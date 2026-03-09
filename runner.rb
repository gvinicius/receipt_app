require_relative './product'
require_relative './price_modifier'
require_relative './order_item'

BOOK_PRODUCTS = ['book'].freeze
FOOD_PRODUCTS = ['chocolate'].freeze
MEDICAL_PRODUCTS = ['headache pills'].freeze
EXCEPTIONS = (BOOK_PRODUCTS + FOOD_PRODUCTS + MEDICAL_PRODUCTS).freeze
imported_price_modifier = PriceModifier.new(:imported, 0.05)
base_tax_price_modifier = PriceModifier.new(:base_tax, 0.1)

puts "Enter the product line, or empty line plus enter to finish"

order_items = []
loop do
  line = STDIN.gets
  break if line.nil?

  line = line.tr("\r", "").strip
  break if line.empty?

  quantity, *name_parts, price = line.split
  name = name_parts.join(" ")
  name.sub(':','').sub('at', '')

  modifiers = []

  modifiers << imported_price_modifier if name.include?('imported')
  modifiers << base_tax_price_modifier unless EXCEPTIONS.any? { |element| name.include?(element) }

  product = Product.new(name, price.to_f, modifiers)
  order_items << OrderItem.new(quantity.to_i, product)
end

order_items.each { |order_item| puts order_item.display }

total = order_items.map { |item| item.quantity.to_f * item.product.final_price.to_f }.sum

total_tax_sum = order_items.map do |item|
  if item.product.price_modifiers.any? { |modifier| modifier.type == base_tax_price_modifier.type }
    item.quantity * base_tax_price_modifier.tax * item.product.price
  end
end.compact.sum

puts "Sales Taxes: #{'%.2f' % total_tax_sum.round(2)}"
puts "Total: #{'%.2f' % total}"
