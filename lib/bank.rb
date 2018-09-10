require 'date'

class Bank
  attr_reader :balance, :transactions
  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    fail 'Cannot credit a nil or a negative amount' if amount <= 0

    @balance += amount
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), credit: amount, debit: 0, balance: @balance)
  end

  def withdraw(amount)
    fail 'Insufficient Funds' if amount > @balance

    @balance -= amount
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), credit: 0, debit: amount, balance: @balance)
  end

  def statement
    print "date || credit || debit || balance \n"
    @transactions.reverse.map { |transaction| print "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n" }
  end
end
