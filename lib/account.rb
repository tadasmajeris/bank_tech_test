class Account

  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if amount > @balance
      raise "Insufficient funds. Current balance: #{@balance}"
    end
    @balance -= amount
  end

end
