-- 1.1 run the factorial example
-- print("enter a negetive number:")
-- a = io.read("*n")
-- print(a)
-- print(a ^ 2)

-- 1.2 run twice function
-- function twice(x)
--     return 2.0 * x
-- end
-- [x] run by `lua -i -lpractice_one -e "x = 10"` and then
-- result > x --> 10 ; > twice(x) --> 20

-- 1.3 other language use "--" for comments
-- SQL , Ada, Haskell, Effel

-- 1.4 valid identifies
-- _end End NULL

-- 1.5 type(nil) == nil --> false
-- this result is false because the result of type function is always type of string and nil is always defined non-value
-- we can change by `type(nil) == "nil"`

-- 1.6 check a value is a boolean without using the function type
-- we can check a value by using condition
-- > a == true or a == false

-- 1.7 consider the expression: (x and y and (not z)) or ((not y) and x)
-- I think the parentheses are necessary, but it's needed to make some optimizations look fine-tuned
-- ((not z) or x) or ((not y) and x)

-- 1.8 write a simple script without knowing it in advance
print("enter your name:")
a = io.read("l")
print(a)
