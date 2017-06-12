require 'account'

describe Account do

  it 'has a balance of zero' do
    expect(subject.balance).to be_zero
  end

  it 'can accept a deposit with a date' do
    subject.deposit(200, '01/04/2017')
    expect(subject.balance).to eq 200
  end

  it 'stores deposit in transactions' do
    subject.deposit(200, '01/04/2017')
    expect(subject.transactions).to eq([{ deposit: 200, date: '01/04/2017'}])
  end

  it 'can accept a withdrawal with a date' do
    subject.withdraw(300, '02/05/2017')
    expect(subject.balance).to eq -300
  end

  it 'stores withdrawal in transactions' do
    subject.withdraw(300, '02/05/2017')
    expect(subject.transactions).to eq([{ withdrawal: 300, date: '02/05/2017'}])
  end

end
