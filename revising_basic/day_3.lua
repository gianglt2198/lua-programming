-- Exercise 1
-- local users = {
--     {
--         name = "Alice",
--         email = "alice@example.com",
--         roles = { "admin", "editor" },
--         metadata = { lastLogin = "2023-01-15" }
--     },
--     {
--         name = "Bob",
--         email = "bob@example.com",
--         roles = { "user" },
--         metadata = { lastLogin = "2023-01-10" }
--     }
-- }

-- Exercise 2
local users = {
    { name = "Alice",   role = "admin", score = 85 },
    { name = "Bob",     role = "user",  score = 75 },
    { name = "Charlie", role = "admin", score = 90 },
    { name = "Dave",    role = "user",  score = 65 },
}

-- Your function should:
-- 1. Filter users by role
-- 2. Sort the filtered users by score (highest first)
-- 3. Return a table of just the names
function getTopUsersByRole(users, role)
    local listUser = {}
    for i = 1, #users do
        if users[i].role == role then
            table.insert(listUser, users[i])
        end
    end

    table.sort(listUser, function(a, b) return a.score > b.score end)

    local result = {}
    for i = 1, #listUser do
        table.insert(result, listUser[i].name)
    end
    return result
end

-- Test
local adminNames = getTopUsersByRole(users, "admin")
-- Should return: {"Charlie", "Alice"}

local nested = {
    name = "Product",
    details = {
        price = 100,
        categories = { "Electronics", "Gadgets" },
        specs = {
            weight = "250g",
            dimensions = {
                height = 10,
                width = 5,
                depth = 2
            }
        }
    },
    inStock = true
}

function flattenTable(tbl, prefix)
    if type(tbl) ~= "table" then
        return tbl, prefix
    end

    local result = {}
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            local flattenedTable = flattenTable(v, k)
            for ck, cv in pairs(flattenedTable) do
                result[k .. "." .. ck] = cv
            end
            goto continue
        end
        result[k] = v
        ::continue::
    end

    return result
end

local result = flattenTable(nested, "")
for k, v in pairs(result) do
    print(k, v)
end
