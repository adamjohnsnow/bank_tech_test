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

**Using Ruby:**
* A class for an Account which manages transactions
* A class for a Transactions log
* A class for Statement which prints all transactions
* Write full unit tests for each function/element of models
* In order to realise the correct data in the statement, deposits and withdrawals will need to carry a date

#### Installation
```
git clone https://github.com/adamjohnsnow/bank_tech_test.git
cd bank_tech_test
bundle install
irb
2.4.0 :001 > load './lib/account.rb'
2.4.0 :002 > load './lib/statement.rb'
```

#### REPL example
```
[2] pry(main)> load './lib/account.rb'
=> true
[3] pry(main)> load './lib/statement.rb'
=> true
[4] pry(main)> account = Account.new
=> #<Account:0x007f92b5825628 @balance=0, @transaction_log=#<TransactionLog:0x007f92b5825600 @history=[]>>
[5] pry(main)> account.deposit(1000, '10/01/2012')
=> [{:deposit=>1000, :date=>"10/01/2012", :balance=>1000}]
[6] pry(main)> account.balance
=> 1000
[7] pry(main)> account.deposit(2000, '13/01/2012')    
=> [{:deposit=>1000, :date=>"10/01/2012", :balance=>1000}, {:deposit=>2000, :date=>"13/01/2012", :balance=>3000}]
[8] pry(main)> account.withdraw(500, '14/01/2012')    
=> [{:deposit=>1000, :date=>"10/01/2012", :balance=>1000}, {:deposit=>2000, :date=>"13/01/2012", :balance=>3000}, {:withdrawal=>500, :date=>"14/01/2012", :balance=>2500}]
[9] pry(main)> statement = Statement.new(account.transaction_log)
=> #<Statement:0x007f92b70136e0
 @headers="date || credit || debit || balance",
 @output=["14/01/2012 || || 500 || 2500", "13/01/2012 || 2000 || || 3000", "10/01/2012 || 1000 || || 1000"],
 @transactions=[{:deposit=>1000, :date=>"10/01/2012", :balance=>1000}, {:deposit=>2000, :date=>"13/01/2012", :balance=>3000}, {:withdrawal=>500, :date=>"14/01/2012", :balance=>2500}]>
[10] pry(main)> statement.print_out
date || credit || debit || balance
14/01/2012 || || 500 || 2500
13/01/2012 || 2000 || || 3000
10/01/2012 || 1000 || || 1000
=> ["date || credit || debit || balance", ["14/01/2012 || || 500 || 2500", "13/01/2012 || 2000 || || 3000", "10/01/2012 || 1000 || || 1000"]]
```
