N = 8 -- board size

numOfCall = 0
-- check whether position (pos, col) is free from attacks
function isValidPosition(b, pos, col)
    numOfCall = numOfCall + 1
    for i = 1, pos - 1 do
        if (b[i] == col) or
            (b[i] - i == col - pos) or
            (b[i] + i == col + pos) then
            return false
        end
    end
    return true -- no attacks
end

-- print a board
function printsolution(b)
    for i = 1, N do
        for j = 1, N do
            io.write(b[i] == j and "X" or "-", " ")
        end
        io.write("\n")
    end
    io.write("\n")
end

-- find one solution
function findsolution(b, pos)
    if pos > N then
        printsolution(b)
    else
        for col = 1, N do
            if isValidPosition(b, pos, col) then
                b[pos] = col
                findsolution(b, pos + 1)
            end
        end
    end
end

-- findsolution({}, 1)

-- 2.1 only show first solution
-- find first solution
function findfirstsolution(b, pos)
    if pos > N then
        printsolution(b)
        return true
    else
        for col = 1, N do
            if isValidPosition(b, pos, col) then
                b[pos] = col
                if findfirstsolution(b, pos + 1) then
                    return true
                end
            end
        end
    end
end

findfirstsolution({}, 1)
print(numOfCall)

numOfCall = 0
-- 2.2 use permutation to solve this math

function isValidSolution(b)
    for i = 1, N do
        if not isValidPosition(b, i, b[i]) then
            return false
        end
    end
    return true
end

function permgen(b, pos)
    pos = pos or b
    if pos < 1 then
        if isValidSolution(b) then
            printsolution(b)
            return true
        end
    else
        for i = 1, pos do
            b[pos], b[i] = b[i], b[pos]
            if permgen(b, pos - 1) then
                return true
            end
            b[pos], b[i] = b[i], b[pos]
        end
    end
end

permgen({ 1, 2, 3, 4, 5, 6, 7, 8 }, 8)
print(numOfCall)
-- after using two solutions,
-- I realized that permutation solutions makes the number of calling isValidPosition greater than backtracking solution
-- with total calling of permutation is 9507 and total calling of backtracking is 876 =)))))
