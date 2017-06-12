class Account
  require_relative './transaction_log'
  require_relative './withdraw'
  require_relative './deposit'
  attr_reader :transaction_log, :balance

  def initialize(transaction_log = TransactionLog.new)
    @balance = 0
    @transaction_log = transaction_log
  end

  def deposit(amount, date)
    @balance += amount
    transaction_log.record(Deposit.new(amount, date, @balance))
  end

  def withdraw(amount, date)
    @balance -= amount
    transaction_log.record(Withdraw.new(amount, date, @balance))
  end
end
