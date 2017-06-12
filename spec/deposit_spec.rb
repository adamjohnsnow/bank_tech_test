require 'deposit'

describe Deposit do
  let(:deposit) { Deposit.new(200, '10/01/2017', 300) }

  it 'gets created with amount' do
    expect(deposit.amount).to eq 200
  end

  it 'gets created with date' do
    expect(deposit.date).to eq '10/01/2017'
  end

  it 'gets created with balance' do
    expect(deposit.balance).to eq 300
  end

  it 'can print itself' do
    expect(deposit.print).to eq '10/01/2017 || 200 || || 300'
  end
end
