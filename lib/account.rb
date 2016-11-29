require_relative 'transaction'

class Account

  def initialize
    @transactions = []
  end

  def deposit(amount)
    raise_error_if_negative(amount)
    @transactions.push Transaction.new(amount)
  end

  def withdraw(amount)
    if amount > balance
      raise "Insufficient funds. Current balance: #{balance}"
    end
    raise_error_if_negative(amount)
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

  private

  def raise_error_if_negative(amount)
    raise "Please specify a positive amount" if amount <= 0
  end

end
