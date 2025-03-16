a = { 1, 2, nil, 4, 5, nil, nil, 6 }
print(#a)

b = {}
b[1] = 1
b[2] = 2
b[5] = 5

print(#b)
for k, v in ipairs(b) do
    print(k, v)
end

for i = 1, #b do
    print(b[i])
end


c = (((b or {}).direction or {}).address or {}).c

d = b and b.a and b.a.b and b.a.b.c
print(d)

sunday = "monday"; monday = "sunday"
t = { sunday = "monday", [sunday] = monday }
print(t.sunday, t[sunday], t[t.sunday])

a = {}; a.a = a
print(a.a.a.a)
a.a.a.a = 3
print(a.a)

e = { ["+"] = "+" }

function evaluatePolynomial(poly, x)
    -- local result = 0
    -- for k, v in ipairs(poly) do
    --     print(k)
    --     result = result + v * math.pow(x, k - 1)
    -- end
    -- return result

    local result = poly[#poly]
    for i = #poly - 1, 1, -1 do
        result = result * x + poly[i]
    end
    return result
end

print(evaluatePolynomial({ 0, 1, 2, 3, 4, 5 }, 2))

function isSeq(t)
    local count = 0
    for k, v in pairs(t) do
        count = count + 1
    end

    return count == #t
end

print(isSeq({ 1, ["a"] = 4, 3 }))

function insertPos(t, pos, at)
    return table.move(t, 1, #t, pos, at)
end

f = insertPos({ 1, 2, 3 }, 6, { 4, 5, 6 })
for i = 1, #f do
    print(f[i])
end

function concat(t)
    local result = ""
    for i = 1, # t do
        result = result .. t[i]
    end
    return result
end

print(concat({ "hello", " ", "world" }))

function create_test_list(size)
    local list = {}
    for i = 1, size do
        if i % 2 == 0 then
            list[i] = " "
        else
            list[i] = "str" .. i
        end
    end
    return list
end

function compare_performance(size)
    -- Create test data
    print("Creating test list of size: " .. size)
    local test_list = create_test_list(size)

    -- Test built-in table.concat
    print("\nTesting table.concat:")
    local t1 = os.time()
    local result1 = table.concat(test_list)
    local t2 = os.time()
    print("Time taken: " .. (t2 - t1) .. " seconds")

    -- Test custom implementation
    print("\nTesting my_concat:")
    local t3 = os.time()
    local result2 = concat(test_list)
    local t4 = os.time()
    print("Time taken: " .. (t4 - t3) .. " seconds")
end

print("Running performance tests...")
compare_performance(100000) -- 100K entries
compare_performance(500000) -- 500K entries
