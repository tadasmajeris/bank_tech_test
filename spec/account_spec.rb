require_relative '../lib/account'

describe Account do

  it 'should start with a balance of 0' do
    expect(subject.balance).to eq 0
  end

end
