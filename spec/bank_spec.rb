require 'bank'
require 'statement'

describe Bank do
  subject(:account) { described_class.new }
  let(:mock_statement) {double :blah}

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
        expect { subject.deposit(-10) }.to raise_error 'Cannot deposit a nil or a negative amount.'
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

      it 'cannot withdraw a negative amount' do
        expect { subject.withdraw(-10) }.to raise_error 'Cannot withdraw a nil or a negative amount.'
      end
    end

    describe "#bank_statement" do
      it 'account receives bank_statement' do
        bank_with_mock_statement = Bank.new(mock_statement)
        expect(mock_statement).to receive(:print_statement)
        bank_with_mock_statement.bank_statement
      end
    end

  end
end
