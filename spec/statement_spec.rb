require 'statement'

describe Statement do
  let(:statement) { Statement.new(transaction_log) }
  let(:deposit) { double amount: 200, date: '01/04/2017', balance: 200 }
  let(:withdrawal) { double amount: 150, date: '02/05/2017', balance: 50 }
  let(:transaction_log) { double history: [deposit, withdrawal] }
  before { allow(withdrawal).to receive(:print).and_return('02/05/2017 || || 150 || 50') }
  before { allow(deposit).to receive(:print).and_return('01/04/2017 || 200 || || 200') }

  it 'has headers' do
    expect(statement.headers).to eq('date || credit || debit || balance')
  end

  it 'prints statement to command line' do
    expect { statement.print_out }.to output("date || credit || debit || balance\n" +
    "02/05/2017 || || 150 || 50\n" +
    "01/04/2017 || 200 || || 200\n").to_stdout
  end
end
