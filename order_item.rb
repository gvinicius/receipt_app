require_relative './product'

class OrderItem
  attr_reader :quantity, :product

  def initialize(quantity, product)
    @quantity = quantity
    @product = product
  end

  def display
    "#{quantity} #{product.name}: #{quantity*product.final_price.round(2)}"
  end
end
