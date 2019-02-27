require 'statement'
require 'bank'

describe Statement do

  subject(:statement) { described_class.new }
  let(:account) { Bank.new }

  describe "#print_statement" do

    it 'throws an error if there are no transactions' do

      expect { subject.print_statement([]) }.to raise_error 'There are no transactions to print.'

    end

    it 'statement shows date, credit amount, debit amount and balance' do

      account.deposit(3000)
      mock_transaction = [{date: Time.now.strftime("%d/%m/%Y"),
      credit: "3000.00", debit: nil, balance: "3000.00"}]
      
      expect { subject.print_statement(mock_transaction) }.to output("date || credit || debit || balance \n#{Time.now.strftime('%d/%m/%Y')} || 3000.00 ||  || 3000.00\n").to_stdout

    end

  end

end
