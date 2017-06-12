class Statement
  attr_reader :output, :headers, :transactions

  def initialize(transactions)
    @headers = 'date || credit || debit || balance'
    @transactions = transactions.history
    @output = []
    stringify_transactions
  end

  def stringify_transactions
    @transactions.reverse.each do |transaction|
      @output << transaction.print
    end
  end

  def print_out
    to_print = [@headers, @output]
    puts to_print
  end
end
