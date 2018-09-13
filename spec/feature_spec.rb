require 'statement'
require 'bank'

describe "Feature Tests " do
  describe Bank do
    subject(:account) { described_class.new }

    it 'User can deposit amount' do
      subject.deposit(2000)
      expect(subject.balance).to eq(2000)
    end

    it 'User can withdraw amount' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect(subject.balance).to eq(500)

    end

    it 'User can view a printed bank statement' do
      subject.deposit(1000)
      subject.withdraw(500)
      expect { subject.bank_statement }.to output("date || credit || debit || balance \n#{Time.now.strftime('%d/%m/%Y')} ||  || 500.00 || 500.00\n#{Time.now.strftime('%d/%m/%Y')} || 1000.00 ||  || 1000.00\n").to_stdout
    end
  end

end
