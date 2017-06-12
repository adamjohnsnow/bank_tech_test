## Bank Tech Test

## Specification

### Requirements

* You should be able to interact with the your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
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

### My Approach

* **Using Ruby:**
* A model for an Account which manages transactions
* A model for Statement which prints all transactions
* Write full unit tests for each function/element of models
* In order to realise the correct data in the statement, deposits and withdrawals will need to carry a date

#### Functional Representation

Objects  | Messages
------------- | -------------
Account  | Withdraw
  | Deposit
Statement | Print

#### REPL example
```
2.4.0 :001 > load './lib/account.rb'
 => true
2.4.0 :002 > load './lib/statement.rb'
 => true
2.4.0 :003 > account = Account.new
 => #<Account:0x007fc9680e90a0 @balance=0, @transactions=[]>
2.4.0 :004 > account.deposit(1000, '10-01-2012')
 => [{:deposit=>1000, :date=>"10-01-2012", :balance=>1000}]
2.4.0 :005 >     account.deposit(2000, '13-01-2012')
 => [{:deposit=>1000, :date=>"10-01-2012", :balance=>1000}, {:deposit=>2000, :date=>"13-01-2012", :balance=>3000}]
2.4.0 :006 >       account.withdraw(500, '14-01-2012')
 => [{:deposit=>1000, :date=>"10-01-2012", :balance=>1000}, {:deposit=>2000, :date=>"13-01-2012", :balance=>3000}, {:withdrawal=>500, :date=>"14-01-2012", :balance=>2500}]
2.4.0 :007 > statement = Statement.new(account.transactions)
 => #<Statement:0x007fc968092520 @headers="date || credit || debit || balance", @transactions=[{:deposit=>1000, :date=>"10-01-2012", :balance=>1000}, {:deposit=>2000, :date=>"13-01-2012", :balance=>3000}, {:withdrawal=>500, :date=>"14-01-2012", :balance=>2500}], @output=["14-01-2012 || || 500 || 2500", "13-01-2012 || 2000 || || 3000", "10-01-2012 || 1000 || || 1000"]>
2.4.0 :008 > statement.print_out
date || credit || debit || balance
14-01-2012 || || 500 || 2500
13-01-2012 || 2000 || || 3000
10-01-2012 || 1000 || || 1000
 => ["date || credit || debit || balance", ["14-01-2012 || || 500 || 2500", "13-01-2012 || 2000 || || 3000", "10-01-2012 || 1000 || || 1000"]]
 ```
