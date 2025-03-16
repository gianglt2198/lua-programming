function f(a, b)
    print(a, b)
end

f()


function foo2()
    return "a", "b"
end

print(foo2())


print(select("#", "a", "b", "c"))

function foo3(...)
    local s = 0
    s = s + (select(1, ...))
    local r = 0
    local args = table.pack(...)
    r = r + args[1]
    return s, r
end

function unpack(t, i, n)
    i = i or 2
    n = n or #t - 1
    if i <= n then
        return t[i], unpack(t, i + 1, n)
    end
end

function shuffle(list)
    local len = #list

    for i = len, 2, -1 do
        local j = math.random(i)

        list[i], list[j] = list[j], list[i]
    end
end

math.randomseed(os.time())
list = { 1, 2, 3, 4, 5, 6 }
shuffle(list)

tmp = table.pack(table.unpack(list), table.unpack(list))
for i = 1, #tmp do
    print(tmp[i])
end


local function combinations(list)
    local function generation(n, result, start, current)
        if #current == n then
            print(table.concat(current, " "))
            return
        end

        for i = start, #list do
            table.insert(current, list[i])
            generation(n, result, i + 1, current)
            table.remove(current)
        end
    end

    for n = 1, #list do
        generation(n, {}, 1, {})
    end
end

combinations({ 1, 2, 3 })


-- Create a function that returns a function with an unbounded call chain
function create_chain()
    -- Create a string of Lua code dynamically
    local code = [[
        return function()
            return load('return function() ]] .. code .. [[end')()()
        end
    ]]

    -- Use load to create the function
    return load(code)()
end

-- Create and call the chain
local f = create_chain()
f() -- This will create a new function and call it indefinitely
