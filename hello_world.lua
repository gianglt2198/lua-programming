-- program "Hello World"
print("Hello Word!")
-- program "notation"
print(13 + 3)
-- program math
print(math.sin(2.3))
-- define functionality
function fact(n)
    if n == 0 then 
        return 1
    else
        return n * fact(n-1)
    end
end
print(fact(5))
-- define norm, twice 
function norm(x, y)
    return math.sqrt(x^2 + y^2)
end 
function twice(x)
    return 2.0*x
end
