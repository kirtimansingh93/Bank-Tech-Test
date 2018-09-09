require 'bank'

describe "Bank Account" do
  # subject(:bank_account){described_class.new}
  subject(:bank_account){Bank.new}
  # bank_account = Bank.new
  it 'has an initial balance of 0' do
    expect(subject.balance).to eq(0)
  end
end
