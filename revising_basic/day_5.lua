-- Create an event emitter
function createEventEmitter()
    local events = {}

    local emitter = {
        on = function(event, callback)
            events[event] = events[event] or {}
            table.insert(events[event], callback)

            return function() -- remove handler functions of event
                local handlers = events[event]
                for i, handler in ipairs(handlers) do
                    if handler == callback then
                        handlers[i] = nil
                    end
                end
            end
        end,
        emit = function(event, ...)
            local handlers = events[event]
            if not handlers then return end

            for _, callback in ipairs(handlers) do
                callback(...)
            end
        end,
        removeAllListeners = function(event)
            if event then
                events[event] = nil
            else
                events = {}
            end
        end
    }

    return emitter
end

-- Example usage
local emitter = createEventEmitter()

-- Register event handlers
local removeUserHandler = emitter.on("user:created", function(user)
    print("User created:", user.name)
end)

emitter.on("user:created", function(user)
    print("Sending welcome email to:", user.email)
end)

emitter.on("user:deleted", function(userId)
    print("User deleted:", userId)
end)

-- Emit events
emitter.emit("user:created", { name = "Alice", email = "alice@example.com" })
emitter.emit("user:deleted", "user123")

-- Remove a specific handler
removeUserHandler()

-- This won't trigger the first handler
emitter.emit("user:created", { name = "Bob", email = "bob@example.com" })

-- Remove all handlers for an event
emitter.removeAllListeners("user:deleted")

-- This won't trigger any handlers
emitter.emit("user:deleted", "user456")

-- Exercise 1
function compose(...)
    local funcs = { ... }
    return function(...)
        local result = { ... }
        for i = #funcs, 1, -1 do
            result = { funcs[i](table.unpack(result)) }
        end
        return table.unpack(result)
    end
end

-- Test your function
function addOne(x) return x + 1 end

function double(x) return x * 2 end

function square(x) return x * x end

local pipeline = compose(square, double, addOne)
print(pipeline(3)) -- Should be 64: square(double(addOne(3))

-- Exercise 2
function memoize(f)
    -- Your code here: implement a function that caches results
    -- of function f based on its arguments
    local result = {}
    return function(...)
        local args = { ... }
        local key = table.concat(args, ",")
        if not result[key] then
            result[key] = f(...)
        end
        return result[key]
    end
end

-- Test with a computationally expensive function
function fibonacci(n)
    if n < 2 then return n end
    return fibonacci(n - 1) + fibonacci(n - 2)
end

local fastFib = memoize(fibonacci)
-- Time both versions calculating fib(30)
local start = os.clock()
fibonacci(30)
print("Regular: " .. os.clock() - start)

start = os.clock()
fastFib(30)
print("Memoized: " .. os.clock() - start)

-- Exercise 3
function createRedisCommandBuilder()
    local commands = {}

    -- local pipe = {
    --     get = function(self, key)
    --         table.insert(commands, { "GET", key })
    --         return self
    --     end,
    --     set = function(self, key, value)
    --         table.insert(commands, { "SET", key, value })
    --         return self
    --     end,
    --     expire = function(self, key, duration)
    --         table.insert(commands, { "EXPIRE", key, duration })
    --         return self
    --     end,
    --     exec = function(self)
    --         local results = {}
    --         for i, cmd in ipairs(commands) do
    --             table.insert(results, "Result of " .. table.concat(cmd, " - ")) -- Placeholder
    --             commands[i] = nil
    --         end
    --         return results
    --     end
    -- }
    -- return pipe

    local builder = {}

    local redisCmds = { "get", "set", "expire", "del" }

    for _, cmd in ipairs(redisCmds) do
        builder[cmd] = function(self, ...)
            table.insert(commands, { string.upper(cmd), ... })
            return self
        end
    end

    builder.exec = function()
        local result = {}
        for i, cmd in ipairs(commands) do
            table.insert(result, "Result of " .. table.concat(cmd, " - "))
        end

        commands = {}

        return result
    end


    return builder
end

-- Example usage:
local redis = createRedisCommandBuilder()
print(table.unpack(redis:set("key", "value"):expire("key", 60):exec()))
print(table.unpack(redis:get("key"):exec()))

-- print(table.unpack(redis.set("key", "value").expire("key", 60).exec()))
-- print(table.unpack(redis.get("key").exec()))
