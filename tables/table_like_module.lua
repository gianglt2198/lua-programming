local MathUtils = {
    version = "1.0",
    author = "Author",

    _validateNumber = function(x)
        return type(x) == "number"
    end
}

function MathUtils.square(x)
    if not MathUtils._validateNumber(x) then
        error("Argument must be a number")
    end
    return x * x
end

function MathUtils.cube(x)
    if not MathUtils._validateNumber(x) then
        error("Argument must be a number")
    end

    return x * x * x
end

return MathUtils
