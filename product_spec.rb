require_relative './product'
require_relative './price_modifier'
require 'rspec'

RSpec.describe Product do
  let(:price_modifier) { PriceModifier.new(:imported, 0.01) }
  let(:product) { Product.new("Widget", 10, [price_modifier]) }

  describe "#initialize" do
    it "sets the name, price and modifiers" do
      expect(product.name).to eq("Widget")
      expect(product.price).to eq(10)
      expect(product.price_modifiers).to match_array([price_modifier])
    end
  end

  describe "#final_price" do
    it "returns the final price" do
      expect(product.final_price).to eq(10.1)
    end
  end
end

