class BalancePrinter

  def self.print_table(transactions)
    header = "date".ljust(11) + "|| credit".ljust(10) + "|| debit".ljust(11) + "|| balance\n"

    ongoing_balance = 0
    row_array = []
    transactions.each do |transaction|
      ongoing_balance += transaction.amount
      row = BalancePrinter.print_row(transaction, ongoing_balance)
      row_array.push(row)
    end

    header + row_array.reverse.join
  end

  def self.print_row(transaction, balance)
    date   = transaction.date.strftime("%d/%m/%Y")
    credit = transaction.amount > 0 ? '%.2f' % transaction.amount : ''
    debit  = transaction.amount < 0 ? '%.2f' % -transaction.amount : ''
    balance_string = '%.2f' % balance
    row = date.ljust(11) + "|| #{credit}".ljust(11) + "|| #{debit}".ljust(11) + "|| #{balance_string}\n"
  end
end
