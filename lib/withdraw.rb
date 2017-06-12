class Withdraw
  attr_reader :amount, :date, :balance

  def initialize(amount, date, balance)
    @amount = amount
    @date = date
    @balance = balance
  end

  def print
    return "#{@date} || || #{@amount} || #{@balance}"
  end
end
