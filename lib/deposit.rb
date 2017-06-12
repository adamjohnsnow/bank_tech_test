class Deposit
  attr_reader :amount, :date, :balance

  def initialize(amount, date, balance)
    @amount = amount
    @date = date
    @balance = balance
  end

  def print
    "#{@date} || #{@amount} || || #{@balance}"
  end
end
