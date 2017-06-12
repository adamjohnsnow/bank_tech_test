require 'account'
require 'statement'

describe 'Feature' do
  let(:account) { Account.new }

  it 'can take initial deposit and print accordingly' do
    account.deposit(1000, '10/01/2012')
    statement = Statement.new(account.transactions)
    expect(statement.print_out).to eq [
      'date || credit || debit || balance',
      ['10/01/2012 || 1000 || || 1000']
      ]
  end

  it 'can take second deposit and print accordingly' do
    account.deposit(1000, '10/01/2012')
    account.deposit(2000, '13/01/2012')
    statement = Statement.new(account.transactions)
    expect(statement.print_out).to eq [
      'date || credit || debit || balance',
      ['13/01/2012 || 2000 || || 3000',
      '10/01/2012 || 1000 || || 1000']
      ]
  end

  it 'can take withdrawal and print accordingly' do
    account.deposit(1000, '10/01/2012')
    account.deposit(2000, '13/01/2012')
    account.withdraw(500, '14/01/2012')
    statement = Statement.new(account.transactions)
    expect(statement.print_out).to eq [
      'date || credit || debit || balance',
      ['14/01/2012 || || 500 || 2500',
      '13/01/2012 || 2000 || || 3000',
      '10/01/2012 || 1000 || || 1000']
      ]
  end
end
