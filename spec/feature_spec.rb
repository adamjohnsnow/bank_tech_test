require 'account'
require 'statement'

describe 'Feature' do
  let(:account) { Account.new }

  it 'can take withdrawals, deposit and print accordingly' do
    account.deposit(1000, '10/01/2012')
    account.deposit(2000, '13/01/2012')
    account.withdraw(500, '14/01/2012')
    statement = Statement.new(account.transaction_log)
    expect { statement.print_out }.to output("date || credit || debit || balance\n" +
    "14/01/2012 || || 500 || 2500\n" +
    "13/01/2012 || 2000 || || 3000\n" +
    "10/01/2012 || 1000 || || 1000\n").to_stdout
  end
end
