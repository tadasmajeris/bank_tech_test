class Transaction

  attr_reader :amount, :date

  def initialize(amount)
    @amount = amount
    @date = DateTime.new
  end

end
