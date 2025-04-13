-- Exercise 1
function reverseString(str)
    local result = ""
    for i = #str, 1, -1 do
        result = result .. string.sub(str, i, i)
    end
    return result
end

print(reverseString("hello")) -- should print "olleh"

-- Exercise 2
function celsiusToFahrenheit(celsius)
    return (celsius * 9 / 5) + 32
end

print(celsiusToFahrenheit(0))   -- should print 32
print(celsiusToFahrenheit(100)) -- should print 212

-- Exercise 3
function countWords(str)
    local count = 0
    -- for i = 0, #str do
    --     if string.sub(str, i, i) == " " then
    --         count = count + 1
    --     end
    -- end
    for word in string.gmatch(str, "%S+") do
        count = count + 1
    end
    count = count + 1
    return count
end

print(countWords("Hello world"))           -- should print 2
print(countWords("This is a test string")) -- should print 5
