-- print(io.open("text.txt", "r"):read("num"))

-- for count = 1, math.huge do
--     local line = io.read("L")
--     if line == nil then break end
--     io.write(string.format("%6d ", count), line)
-- end

-- local count = 0
-- for line in io.lines() do
--     count = count + 1
--     io.write(string.format("%6d ", count), line, "\n")
-- end

-- local lines = {}
-- for line in io.lines() do
--     lines[#lines + 1] = line
-- end
-- table.sort(lines)
-- for _, l in ipairs(lines) do
--     io.write(l, "\n")
-- end

-- io.write('Hello, what is your name? ')
-- local name = io.read()
-- io.write('Nice to meet you, ', name, '!\n')

-- local f = assert(io.open("text.txt", "r"))
-- local t = f:read("a")
-- f:close()
-- print(t)

-- print(os.getenv("PATH"):gsub(":", "\n"))

-- function createDir(dirname)
--     os.execute("mkdir -p " .. dirname)
-- end

-- createDir("test")

function removeDir(dirname)
    os.execute("rm -rf " .. dirname)
end

removeDir("test")
