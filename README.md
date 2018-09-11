# Bank Tech Test


#### 1. Open your terminal and clone the repository.
`git clone https://github.com/kirtimansingh93/bank-tech-test`

#### 2. Install gemfiles: rspec(testing), SimpleCov(testing coverage) and rubocop(formatting errors).
`bundle install`

#### 3. Run IRB.
`irb`

#### 4. Require file you wish to use.
`require './lib/bank.rb'`

#### 5. Initialize a bank account.
`account = Bank.new`

#### 6. Deposit/Withdraw an amount.
* To deposit/credit : `account.deposit(amount)`
* To withdraw/debit : `account.withdraw(amount)`

#### 7. View your transactions.
`account.transactions`

#### 8. View your balance.
`account.balance`

#### 8. Print statement.
`account.statement`

#### 10. View tests and test coverage.
`rspec`

#### 11. When finished, exit IRB
`exit`


####User stories:
```
As a customer,
So that I can store my money,
I would like to open a bank account .
```
```
As a customer,
So that I can add money into my account,
I would like to be able to make deposits.
```
```
As a customer,
So that I can take out money from my account,
I would like to be able to make withdrawals.
```
```
As a customer,
So that I can see my transaction history,
I would like to be able view my transactions.
```
```
As a customer,
So that I check how much money I have,
I would like to be able to view my balance.
```
```
As a customer,
So that I can see my check the cashflow in and out of my account,
I would like to be able print a statement.
```

## Specification

### Requirements

* You should be able to interact with your code via a REPL like IRB   (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

### Acceptance criteria

**Given** a client makes a deposit of 1000 on 10-01-2012  
**And** a deposit of 2000 on 13-01-2012  
**And** a withdrawal of 500 on 14-01-2012  
**When** she prints her bank statement  
**Then** she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```
