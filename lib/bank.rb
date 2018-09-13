require 'date'
require_relative 'statement'

class Bank
  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
    @statement = Statement.new
  end

  def deposit(amount)
    fail 'Cannot deposit a nil or a negative amount.' if amount <= 0

    @balance += amount
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), credit: sprintf('%.2f', amount), debit: nil, balance: sprintf('%.2f', @balance))
  end

  def withdraw(amount)
    fail 'Insufficient Funds' if amount > @balance
    fail 'Cannot withdraw a nil or a negative amount.' if amount <= 0

    @balance -= amount
    @transactions.push(date: Time.now.strftime("%d/%m/%Y"), credit: nil, debit: sprintf('%.2f', amount), balance: sprintf('%.2f', @balance))
  end

  def statement
    @statement.print_statement(@transactions)
  end
end
