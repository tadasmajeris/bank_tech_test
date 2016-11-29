require_relative '../lib/transaction'

describe Transaction do

  describe 'initialisation' do

    it 'must be created with an amount' do
      trans = Transaction.new(500)
      expect(trans.amount).to eq 500
    end

    it 'is created with todays date' do
      today = Date.new
      trans = Transaction.new(500)
      expect(trans.date).to eq today
    end

  end

end
