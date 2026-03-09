# frozen_string_literal: true

require 'rspec'
require_relative 'order_item'

RSpec.describe OrderItem do
  let(:quantity) { 1 }
  let(:price_modifier) { PriceModifier.new(:base_tax, 0.1) }
  let(:product) { Product.new('music CD', 14.99, [price_modifier]) }
  subject(:order_item) { OrderItem.new(quantity, product) }

  describe '#initialize' do
    it 'sets the product and quantity' do
      expect(order_item.quantity).to eq(quantity)
      expect(order_item.product.name).to eq(product.name)
    end
  end

  describe '#display' do
    it 'returns the final price' do
      expect(order_item.display).to eq('1 music CD: 16.49')
    end
  end
end
