local MathUtils = {
    version = "1.0",
    author = "Author",

    _validateNumber = function(x)
        return type(x) == "number"
    end
}

function MathUtils.add(x, y)
    if not MathUtils._validateNumber(x) or not MathUtils._validateNumber(y) then
        error("Arguments must be numbers")
    end
    return x + y
end

function MathUtils.power(x, y)
    if not MathUtils._validateNumber(x) or not MathUtils._validateNumber(y) then
        error("Arguments must be numbers")
    end
    return x ^ y
end

function MathUtils.divide(x, y)
    if not MathUtils._validateNumber(x) or not MathUtils._validateNumber(y) or y == 0 then
        error("Arguments must be numbers or y != 0")
    end
    return x / y
end

return MathUtils
