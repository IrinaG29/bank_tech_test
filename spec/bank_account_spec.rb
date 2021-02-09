require './lib/bank_account'

describe BankAccount do
  it "returns the balance" do
    subject.deposit(100)
    subject.deposit(100)
    expect(subject.balance).to eq(200)
  end

  it "withdraws money from account" do
    subject.deposit(200)
    subject.withdraw(50)
    expect(subject.balance).to eq(150)
  end

  it "prints the date, amount, type, balance" do
    subject.deposit(100)
    expect(subject.transactions.last).to eq({ date: Date.today, amount: 100, type: "credit", balance: 100 })
  end

  it "prints the date, amount, type, balance" do
    subject.deposit(200)
    subject.withdraw(100)
    expect(subject.transactions[0]).to eq({ date: Date.today, amount: 200, type: "credit", balance: 200 })
    expect(subject.transactions[1]).to eq({ date: Date.today, amount: 100, type: "debit", balance: 100 })
  end
end
