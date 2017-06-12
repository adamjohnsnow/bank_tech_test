class TransactionLog
  attr_reader :history

  def initialize
    @history = []
  end

  def record(type, amount, date, balance)
    transaction = Hash.new 0
    transaction.store(type.to_sym, amount)
    transaction.store(:date, date)
    transaction.store(:balance, balance)
    @history << transaction
  end
end
