require_relative '../lib/transaction'

describe Transaction do

  describe 'initialisation' do

    it 'must be created with an amount' do
      trans = Transaction.new(500)
      expect(trans.amount).to eq 500
    end

    it 'is created with todays date' do
      today = Time.new.strftime("%d/%m/%Y")
      trans = Transaction.new(500)
      date = trans.date.strftime("%d/%m/%Y")
      expect(date).to eq today
    end

  end

end
