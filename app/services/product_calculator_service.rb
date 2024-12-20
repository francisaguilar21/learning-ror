class ProductCalculatorService < ApplicationService
  def initialize(amount, discount_percentage)
    @amount = amount
    @discount_percentage = discount_percentage
  end

  def compute_discount
    @discounted_price = 0.00

    begin
      @discounted_price = @amount * @discount_percentage / 100.00
    rescue
      puts "Amount or discount % is nil"
    ensure
      @discounted_price
    end
  end
end