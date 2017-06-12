require 'statement'

describe Statement do
  let(:account) { double transactions: [
    { deposit: 200, date: '01/04/2017'},
    { withdrawal: 300, date: '02/05/2017'}
    ] }

  it 'has headers' do
    expect(subject.headers).to eq('date || credit || debit || balance')
  end

  it 'converts transactions to strings' do

  end
end
