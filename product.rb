require_relative './price_modifier'

class Product
  attr_reader :name, :price, :price_modifiers

  def initialize(name, price, price_modifiers)
    @name = name
    @price = price
    @price_modifiers = price_modifiers
  end

  def final_price
    price*(1 + price_modifiers.map(&:tax).map(&:to_f).sum)
  end
end
