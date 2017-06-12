class Account
  attr_reader :transactions, :balance

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount, date)
    @balance += amount
    add_to_transactions(:deposit, amount, date)
  end

  def withdraw(amount, date)
    @balance -= amount
    add_to_transactions(:withdrawal, amount, date)
  end

private

  def add_to_transactions(type, amount, date)
    transaction = Hash.new 0
    transaction.store(type.to_sym, amount)
    transaction.store(:date, date)
    @transactions << transaction
  end

end
