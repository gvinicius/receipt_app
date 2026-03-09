# frozen_string_literal: true

require_relative 'price_modifier'

class Product
  attr_reader :name, :price, :price_modifiers

  def initialize(name, price, price_modifiers)
    @name = name
    @price = price
    @price_modifiers = price_modifiers
  end

  def tax_amount
    price_modifiers.to_a.map { |m| (m.tax * price / 0.05).ceil * 0.05 }.sum
  end

  def final_price
    price + tax_amount
  end
end
