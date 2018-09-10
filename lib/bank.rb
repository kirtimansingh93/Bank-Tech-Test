require 'date'

class Bank
  attr_reader :balance, :transactions
  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance =+ amount
    @transactions.push(date: Date.today, credit:amount, debit:0, balance: @balance)
  end

  def withdraw(amount)
    fail 'Insufficient Funds' if amount > @balance
    @balance -= amount
    @transactions.push(date: Date.today, credit:0, debit:amount, balance: @balance)
  end
end
