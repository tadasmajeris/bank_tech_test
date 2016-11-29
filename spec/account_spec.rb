require_relative '../lib/account'
require_relative '../lib/transaction'

describe Account do

  it 'should start with a balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '#deposit' do
    it 'allows to deposit money into account' do
      subject.deposit(500)
      subject.deposit(200)
      expect(subject.balance).to eq 700
    end

    it 'saves a transaction object to history' do
      subject.deposit(500)
      transactions = subject.transactions
      expect(transactions.length).to eq 1
      expect(transactions.last).to be_kind_of(Transaction)
    end

    it 'throws an error of amount is not positive' do
      expect { subject.deposit(-500) }.to raise_error 'Please specify a positive amount'
      expect { subject.deposit(0) }.to raise_error 'Please specify a positive amount'
    end

  end

  describe '#withdraw' do
    before { subject.deposit(1000) }

    it 'saves the withdrawal transaction to history' do
      expect { subject.withdraw(500) }.to change { subject.transactions.length }.by(1)
    end

    it 'allows to withdraw money from account' do
      subject.withdraw(400)
      subject.withdraw(500)
      expect(subject.balance).to eq 100
    end

    it 'throws an error when trying to withdraw more than the balance' do
      expect { subject.withdraw(1001) }.to raise_error 'Insufficient funds. Current balance: 1000'
    end

    it 'throws an error of amount is not positive' do
      expect { subject.withdraw(-500) }.to raise_error 'Please specify a positive amount'
      expect { subject.withdraw(0) }.to raise_error 'Please specify a positive amount'
    end
  end

end
