class Transaction

  attr_reader :amount, :date

  def initialize(amount)
    @amount = amount
    @date = Time.new
  end

end
