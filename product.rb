require_relative './price_modifier'

class Product
  attr_reader :name, :price, :price_modifiers

  def initialize(name, price, price_modifiers)
    @name = name
    @price = price
    @price_modifiers = price_modifiers
  end

 def taxed_price
   price_modifiers.to_a.map(&:tax).map(&:to_f).sum.to_f
 end

 def basically_taxed_price
   price_modifiers.select { |element| element.type == :base_tax }.to_a.map(&:tax).map(&:to_f).sum.to_f
 end

  def final_price
    price*(1 + taxed_price)
  end
end
