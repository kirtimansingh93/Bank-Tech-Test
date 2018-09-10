require 'date'

class Bank
  attr_reader :balance, :transactions
  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), credit:amount, debit:0, balance: @balance)
  end

  def withdraw(amount)
    fail 'Insufficient Funds' if amount > @balance
    @balance -= amount
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), credit:0, debit:amount, balance: @balance)
  end

  def statement
    @transactions.reverse.map { |transaction| transaction }
  end
end
