class ProductCalculatorService < ApplicationService
  def initialize(amount, discount_percentage)
    @amount = amount
    @discount_percentage = discount_percentage
  end

  def compute_discount
    @amount * @discount_percentage / 100.0
  end
end