require 'bank'

describe 'Bank Account' do
  # subject(:bank_account){described_class.new}
  subject(:bank_account) { Bank.new }
  # bank_account = Bank.new
  it 'has an initial balance of 0' do
    expect(subject.balance).to eq(0)
  end

  it 'can deposit money' do
    # expect((subject.deposit(1000)).balance).to eq(1000)
    subject.deposit(1000)
    expect(subject.balance).to eq(1000)
  end
  
end
