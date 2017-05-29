require "pry"
class CashRegister
  attr_accessor :total, :discount, :items, :cart_status

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def total
    return @total
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      items << title
    end
    self.cart_status = price * quantity
  end

  def apply_discount
    if @discount > 0
      #total_with_discount = (@total - (@total * (@discount * 0.01).floor))
      @total -= (@total * (@discount * 0.01))
      return "After the discount, the total comes to $#{@total.floor}."
    else
      return "There is no discount to apply."
    end
  end


  def void_last_transaction
    self.total = self.total - self.cart_status
  end



end
