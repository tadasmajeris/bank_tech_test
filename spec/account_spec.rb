require_relative '../lib/account'

describe Account do

  it 'should start with a balance of 0' do
    expect(subject.balance).to eq 0
  end

  describe '#deposit' do
    it 'allows to deposit money into account' do
      subject.deposit(500)
      subject.deposit(200)
      expect(subject.balance).to eq 700
    end
  end

end
