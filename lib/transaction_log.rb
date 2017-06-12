class TransactionLog
  attr_reader :history

  def initialize
    @history = []
  end

  def record(transaction)
    @history << transaction
  end
end
