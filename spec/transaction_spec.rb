require_relative '../lib/transaction'

describe Transaction do

  it 'must be created with an amount' do
    trans = Transaction.new(500)
    expect(trans.amount).to eq 500
  end
end
