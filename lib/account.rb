require_relative 'transaction'

class Account

  def initialize
    @transactions = []
  end

  def deposit(amount)
    @transactions.push Transaction.new(amount)
  end

  def withdraw(amount)
    if amount > balance
      raise "Insufficient funds. Current balance: #{balance}"
    end
    @transactions.push Transaction.new(-amount)
  end

  def transactions
    @transactions.dup
  end

  def balance
    return 0 if @transactions.empty?
    balance = @transactions.inject(0) do |sum, transaction|
      sum += transaction.amount
    end
    balance
  end

end
