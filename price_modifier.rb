# frozen_string_literal: true

class PriceModifier
  attr_reader :type, :tax

  def initialize(type, tax)
    @type = type
    @tax = tax
  end
end
