require "date"
require "terminal-table"

class BankAccount

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    @transactions << {date: Date.today, amount: amount, type: "credit", balance: @balance}
  end

  def withdraw(amount)
    @balance -= amount
    @transactions << {date: Date.today, amount: amount, type: "debit", balance: @balance}
  end

  def balance
    @balance
  end

  def transactions
    @transactions
  end

  def statement
    Terminal::Table.new headings: ['date', 'credit', 'debit', 'balance'],
                        rows: transactions.map{|t| row_for_transaction(t)}
  end

  private

  def row_for_transaction(transaction)
    if transaction[:type] == "credit"
      [transaction[:date], transaction[:amount], nil, transaction[:balance]]
    else
      [transaction[:date], nil, transaction[:amount], transaction[:balance]]
    end
  end
end
