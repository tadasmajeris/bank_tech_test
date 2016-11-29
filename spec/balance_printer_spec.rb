require_relative '../lib/balance_printer'

describe BalancePrinter do

  let(:transaction1) { double :transaction, amount: 1000, date: Time.new }
  let(:transaction2) { double :transaction, amount: 1100, date: Time.new }

  describe '#print_table' do

    it 'prints balance in a nice table' do
      formated_date = transaction1.date.strftime("%d/%m/%Y")
      expect(BalancePrinter.print_table([transaction1])).to eq "date       || credit || debit   || balance\n#{formated_date} || 1000.00 ||         || 1000.00\n"
    end

    it 'prints transactions in descending date order' do
      formated_date = transaction1.date.strftime("%d/%m/%Y")
      array = [transaction1, transaction2]
      expect(BalancePrinter.print_table(array)).to eq "date       || credit || debit   || balance\n#{formated_date} || 1100.00 ||         || 2100.00\n#{formated_date} || 1000.00 ||         || 1000.00\n"
    end
    
  end

end
