require 'withdraw'

describe Withdraw do
  let(:withdraw) { Withdraw.new(200, '10/01/2017', 300) }

  it 'gets created with amount' do
    expect(withdraw.amount).to eq 200
  end

  it 'gets created with date' do
    expect(withdraw.date).to eq '10/01/2017'
  end

  it 'gets created with balance' do
    expect(withdraw.balance).to eq 300
  end

  it 'can print itself' do
    expect(withdraw.print).to eq '10/01/2017 || || 200 || 300'
  end
end
