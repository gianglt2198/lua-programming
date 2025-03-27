local BankAccount = {
    accountNumber = "",
    balance = 0,
    transactions = {}
}

function BankAccount:new(accountNumber, balance)
    if type(balance) ~= "number" or balance < 0 then
        error("Invalid initial balance")
    end
    local obj = {
        accountNumber = accountNumber,
        balance = balance,
        transactions = {}
    }

    setmetatable(obj, { __index = BankAccount })
    return obj
end

function BankAccount:deposit(money)
    if type(money) ~= "number" or money <= 0 then
        error("Invalid deposit amount")
    end
    self.balance = self.balance + money
    table.insert(self.transactions, {
        type = "deposit",
        amount = money,
        date = os.date()
    })
    return true
end

function BankAccount:withdraw(money)
    if type(money) ~= "number" or money <= 0 then
        error("Invalid withdrawal amount")
    end

    if self.balance < money then
        return false, "Insufficient funds"
    end

    self.balance = self.balance - money
    table.insert(self.transactions, {
        type = "withdrawal",
        amount = money,
        date = os.date()
    })
    return true
end

function BankAccount:getTransactionHistory()
    return self.transactions
end

function BankAccount:getBalance()
    return self.balance
end

local account = BankAccount:new("1234", 1000)
account:deposit(500)        -- Should work
account:withdraw(200)       -- Should work
account:withdraw(2000)      -- Should fail (insufficient funds)
print(account:getBalance()) -- Should print current balance

local transactions = account:getTransactionHistory()
for _, transaction in ipairs(transactions) do
    print(transaction.type, transaction.amount, transaction.date)
end
