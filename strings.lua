---- STRING

local a = "one string"
local b = string.gsub(a, "one", "another")
print(a, #a)
print(b, #b)

local c = "hello"
print(c)
c = c .. "world"
print(c)

local page = [[
<html>
<head>
<title>An HTML Page</title>
</head>
<body>
<a href="http://www.lua.org">Lua</a>
</body>
</html>
]]
print(page)


print("one line\ttwo line\vthree line\nfour line\ffive line\bsix line\aseven live")
print("ALO\n123\"")
print('\x41LO\10\04923"')


data = "abc bcd edf\z
ghj"
print(data)

print(string.sub("[in bracket]", 2, -2))

print(string.format("%d, %s, %0.4f, %02d", 1, "abc", 0.41235678, 1))

-- 4.1 print XML as string
-- <![CDATA[
-- Hello world
-- ]]>
-- 4.1.1 using \n
-- 4.1.2 using \z
-- 4.1.3 using [[]]

-- 4.2 using \z for long abitrary bytes

-- 4.3 - 4.4 function insert string
function insert(s, pos, sub)
    -- return string.sub(s, 1, pos - 1) .. sub .. string.sub(s, pos, string.len(s))

    local offset = utf8.offset(s, pos)
    if offset == nil then
        return s .. sub
    end

    return string.sub(s, 1, offset - 1) .. sub .. string.sub(s, offset)
end

-- 4.5 - 4.6 remove
function remove(s, pos, len)
    -- return string.sub(s, 1, pos - 1) .. string.sub(s, pos + len)
    local byte_start = utf8.offset(s, pos)
    local byte_end = utf8.offset(s, pos + len)
    if byte_end == nil then
        byte_end = #s + 1
    end
    local front = string.sub(s, 1, byte_start - 1)
    local back = string.sub(s, byte_end)
    return front .. back
end

print(remove("ação", 2, 2))

-- 4.7
function ispali(s)
    local s = string.lower(string.gsub(s, "%s", ""))
    local left = 1
    local right = #s

    while left < right do
        if string.sub(s, left, left) ~= string.sub(s, right, right) then
            return false
        end
        left = left + 1
        right = right - 1
    end

    return true
end

print(ispali("steps o spets"))

-- 4.9
function ispali8(s)
    local chars = {}
    for _, c in utf8.codes(s) do
        table.insert(chars, c)
    end

    local left, right = 1, #chars
    while left < right do
        if chars[left] ~= chars[right] then
            return false
        end
        left = left + 1
        right = right - 1
    end

    return true
end

print(ispali8("áçaçá"))
