require_relative '../lib/transaction'

describe Transaction do

  describe 'initialisation' do

    it 'must be created with an amount' do
      trans = Transaction.new(500)
      expect(trans.amount).to eq 500
    end

    it 'can be created with a specific date' do
      date = Date.parse('21/11/2016')
      trans = Transaction.new(500, date)
      expect(trans.date).to eq date
    end

    it 'is created with todays date if date is not given' do
      today = Date.new
      trans = Transaction.new(500)
      expect(trans.date).to eq today
    end

  end

  describe '#status' do

    it 'knows that its a debit if amount < 0' do
      trans = Transaction.new(-500)
      expect(trans.status).to eq :debit
    end

    it 'knows that its a credit if amount >= 0' do
      trans = Transaction.new(500)
      expect(trans.status).to eq :credit
    end

  end

end
