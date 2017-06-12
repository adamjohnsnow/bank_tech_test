require 'transaction_log'

describe TransactionLog do
  let(:transaction_log) { TransactionLog.new }
  let(:deposit) { double amount: 200, date: '01/04/2017', balance: 500 }

  it 'initializes with empty array' do
    expect(transaction_log.history).to eq []
  end

  it 'stores items with balance' do
    transaction_log.record(deposit)
    expect(transaction_log.history[0].balance).to eq 500
  end

  it 'stores items with dates' do
    transaction_log.record(deposit)
    expect(transaction_log.history[0].date).to eq '01/04/2017'
  end

  it 'stores items with amounts' do
    transaction_log.record(deposit)
    expect(transaction_log.history[0].amount).to eq 200
  end

end
