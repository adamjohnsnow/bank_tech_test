class Account
  require_relative './transaction_log'
  attr_reader :transaction_log, :balance

  def initialize(transaction_log = TransactionLog.new)
    @balance = 0
    @transaction_log = transaction_log
  end

  def deposit(amount, date)
    @balance += amount
    transaction_log.record(:deposit, amount, date, @balance)
  end

  def withdraw(amount, date)
    @balance -= amount
    transaction_log.record(:withdrawal, amount, date, @balance)
  end
end
