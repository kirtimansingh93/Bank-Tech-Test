require 'bank'

describe Bank do
  subject(:account) { described_class.new }

  describe 'Bank Account:' do
    describe ':balance' do
      it 'has an initial balance of 0' do
        expect(subject.balance).to eq(0)
      end
    end

    describe "#deposit" do
      it 'can credit amount' do
        subject.deposit(1000)
        subject.deposit(1000)
        expect(subject.balance).to eq(2000)
      end
      it 'cannot credit a negative amount' do
        expect { subject.deposit(-10) }.to raise_error 'Cannot credit a nil or a negative amount'
      end
    end

    describe "#withdraw" do
      it 'can debit amount' do
        subject.deposit(3000)
        subject.withdraw(500)
        subject.withdraw(500)
        expect(subject.balance).to eq(2000)
      end

      it 'cannot withdraw if debit amount is more than balance' do
        expect { subject.withdraw(100) }.to raise_error 'Insufficient Funds'
      end
    end

    describe ':transactions' do
      it 'initially has no transactions' do
        expect(subject.transactions).to be_empty
      end
      it 'can show transaction history' do
        subject.deposit(3000)
        subject.withdraw(500)
        expect(subject.transactions).to include({ date: Time.now.strftime("%d/%m/%Y"),
        credit: "3000.00", debit: nil, balance: "3000.00" }, { date: Time.now.strftime("%d/%m/%Y"),
        credit: nil, debit: "500.00", balance: "2500.00" })
      end
    end

    describe "#statement" do
      it 'statement shows date, credit amount, debit amount and balance' do
        subject.deposit(3000)
        expect { subject.statement }.to output("date || credit || debit || balance \n#{Time.now.strftime('%d/%m/%Y')} || 3000.00 ||  || 3000.00\n").to_stdout
      end
    end

  end
end
