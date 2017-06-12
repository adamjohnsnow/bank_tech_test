require 'statement'

describe Statement do
  let(:transaction_log) { double history: [
                  { deposit: 200, date: '01/04/2017', balance: 200 },
                  { withdrawal: 150, date: '02/05/2017', balance: 50 }
                  ]
  }
  let(:statement) { Statement.new(transaction_log) }

  it 'has headers' do
    expect(statement.headers).to eq('date || credit || debit || balance')
  end

  it 'gets transactions from argument' do
    expect(statement.transactions).to eq [
      { deposit: 200, date: '01/04/2017', balance: 200 },
      { withdrawal: 150, date: '02/05/2017', balance: 50 }
      ]
  end

  it 'converts array of transactions to reversed array of strings' do
    expect(statement.output).to eq [
      '02/05/2017 || || 150 || 50',
      '01/04/2017 || 200 || || 200'
      ]
  end

  it 'creates full statement' do
    expect(statement.print_out).to eq [
      'date || credit || debit || balance', [
        '02/05/2017 || || 150 || 50',
        '01/04/2017 || 200 || || 200'
      ]
    ]
  end

  it 'prints statement to command line' do
    expect{ statement.print_out }.to output("date || credit || debit || balance\n" +
    "02/05/2017 || || 150 || 50\n" +
    "01/04/2017 || 200 || || 200\n").to_stdout
  end
end
