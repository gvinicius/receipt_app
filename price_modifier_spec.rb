# frozen_string_literal: true

require_relative 'price_modifier'
require 'rspec'

RSpec.describe PriceModifier do
  let!(:price_modifier) { PriceModifier.new(:imported, 0.01) }

  describe '#initialize' do
    it 'sets the type and tax' do
      expect(price_modifier.type).to eq(:imported)
      expect(price_modifier.tax).to eq(0.01)
    end
  end
end
