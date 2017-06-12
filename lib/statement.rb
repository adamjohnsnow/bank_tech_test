class Statement
  attr_reader :output, :headers

  def initialize(transactions)
    @headers = 'date || credit || debit || balance'
    print_transactions(transactions)
  end

  def print_transactions(transactions)
  end

end
