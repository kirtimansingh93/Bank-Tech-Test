require 'date'
require_relative 'statement'

class Bank
  attr_reader :balance

  def initialize(statement = Statement.new)
    @balance = 0
    @transactions = []
    @statement = statement
  end

  def deposit(amount, day = Time.now.strftime("%d"), month = Time.now.strftime("%m"), year = Time.now.strftime("%Y"))
    fail 'Cannot deposit a nil or a negative amount.' if amount <= 0
    @balance += amount
    @transactions.push(date: Time.now.strftime("#{day}/#{month}/#{year}"), credit: sprintf('%.2f', amount), debit: nil, balance: sprintf('%.2f', @balance))
  end

  def withdraw(amount, day = Time.now.strftime("%d"), month = Time.now.strftime("%m"), year = Time.now.strftime("%Y"))
    fail 'Insufficient Funds' if amount > @balance
    fail 'Cannot withdraw a nil or a negative amount.' if amount <= 0

    @balance -= amount
    @transactions.push(date: Time.now.strftime("#{day}/#{month}/#{year}"), credit: nil, debit: sprintf('%.2f', amount), balance: sprintf('%.2f', @balance))
  end

  def bank_statement
    @statement.print_statement(@transactions)
  end
end
