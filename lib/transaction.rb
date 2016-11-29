class Transaction
  attr_reader :amount, :date

  def initialize(amount, date = Date.new)
    @amount = amount
    @date = date
  end
end
