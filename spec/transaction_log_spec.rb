require 'transaction_log'

describe TransactionLog do
  let(:transaction_log) { TransactionLog.new }

  it 'initializes with empty array' do
    expect(transaction_log.history).to eq []
  end

  it 'stores deposits' do
    transaction_log.record(:deposit, 200, '01/04/2017', 200)
    expect(transaction_log.history).to eq [
      { deposit: 200, date: '01/04/2017', balance: 200 }
    ]
  end

  it 'stores withdrawals' do
    transaction_log.record(:withdrawal, 100, '01/04/2017', -100)
    expect(transaction_log.history).to eq [
      { withdrawal: 100, date: '01/04/2017', balance: -100 }
    ]
  end

end
