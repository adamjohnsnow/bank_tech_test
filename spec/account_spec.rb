require 'account'

describe Account do
  let(:log) { double transaction_log: []}
  let(:account) { Account.new(log)}
  before{ allow(log).to receive(:record) }

  it 'has a balance of zero' do
    expect(account.balance).to be_zero
  end

  it 'can accept a deposit with a date' do
    account.deposit(200, '01/04/2017')
    expect(account.balance).to eq(200)
  end


  it 'balance updates for two deposits' do
    account.deposit(200, '01/04/2017')
    account.deposit(500, '01/04/2017')
    expect(account.balance).to eq(700)
  end

  it 'can accept a withdrawal with a date' do
    account.withdraw(300, '02/05/2017')
    expect(account.balance).to eq(-300)
  end
end
