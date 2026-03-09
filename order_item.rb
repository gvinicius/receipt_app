# frozen_string_literal: true

require_relative 'product'

class OrderItem
  attr_reader :quantity, :product

  def initialize(quantity, product)
    @quantity = quantity
    @product = product
  end

  def display
    "#{quantity} #{product.name}: #{format('%.2f', quantity * product.final_price)}"
  end
end
