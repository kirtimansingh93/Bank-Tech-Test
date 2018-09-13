require 'statement'
require 'bank'

describe Statement do
  subject(:statement) { described_class.new }
  let(:account) { Bank.new }
  describe "#print_statement" do
    it 'throws an error if there are no transactions' do
      expect { subject.print_statement(@transactions) }.to raise_error 'There are no transactions to print.'
    end
    it 'statement shows date, credit amount, debit amount and balance' do
      account.deposit(3000)
      expect { subject.print_statement(account.transactions) }.to output("date || credit || debit || balance \n#{Time.now.strftime('%d/%m/%Y')} || 3000.00 ||  || 3000.00\n").to_stdout
    end
  end
end
