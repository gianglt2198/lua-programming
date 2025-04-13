-- Exercise 1
function fizzBuzz(n)
    if n % 3 == 0 and n % 5 == 0 then
        print("FizzBuzz")
    elseif n % 3 == 0 then
        print("Fizz")
    else
        print("Buzz")
    end
end

fizzBuzz(9)

-- Exercise 2
function filterEven(numbers)
    local result = {}
    for i, v in ipairs(numbers) do
        if v % 2 == 0 then
            table.insert(result, v)
        end
    end
    return result
end

local nums = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
local result = filterEven(nums)
-- Should return {2, 4, 6, 8, 10}

-- Exercise 3
function createGreeter(greeting)
    return function(name)
        return greeting .. " " .. name
    end
end

local sayHello = createGreeter("Hello")
local sayHi = createGreeter("Hi")

print(sayHello("Alice")) -- should print "Hello, Alice"
print(sayHi("Bob"))      -- should print "Hi, Bob"
