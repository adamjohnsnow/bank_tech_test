class Statement
  attr_reader :output, :headers, :transactions

  def initialize(transactions)
    @headers = 'date || credit || debit || balance'
    @transactions = transactions
    @output = []
    stringify_transactions
  end

  def stringify_transactions
    @transactions.each do |transaction|
      if transaction.keys[0] == :deposit
        enter_deposit(transaction)
      else
        enter_withdrawal(transaction)
      end
    end
  end

  private

  def enter_deposit(transaction)
    statement_line = "#{transaction[:date]} || #{transaction[:deposit]} || || #{transaction[:balance]}"
    @output << statement_line
  end

  def enter_withdrawal(transaction)
    statement_line = "#{transaction[:date]} || || #{transaction[:withdrawal]} || #{transaction[:balance]}"
    @output << statement_line
  end

end
