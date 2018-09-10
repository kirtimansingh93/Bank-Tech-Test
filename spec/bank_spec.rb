require 'bank'

describe Bank do
  subject(:account) {described_class.new}

  describe 'Bank Account:' do
    it 'has an initial balance of 0' do
      expect(subject.balance).to eq(0)
    end

    it 'can credit amount' do
      # expect((subject.deposit(1000)).balance).to eq(1000)
      subject.deposit(1000)
      expect(subject.balance).to eq(1000)
    end

    it 'can debit amount' do
      subject.deposit(3000)
      subject.withdraw(500)
      expect(subject.balance).to eq(2500)
    end

    it 'cannot withdraw if debit amount is more than balance' do
      expect { subject.withdraw(100) }.to raise_error 'Insufficient Funds'
    end

    it 'can show transaction history' do
      subject.deposit(3000)
      subject.withdraw(500)
      expect(subject.transactions).to include({ date: Date.today, credit:3000, debit:0, balance:3000 }, { date: Date.today, credit:0, debit:500, balance:2500 })
    end
  end
end
