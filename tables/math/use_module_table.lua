-- local math_utils = require("tables/table_like_module")
-- print(math_utils.version)
-- print(math_utils.square(2))
-- print(math_utils.cube("A"))

local mathUtils = require("tables/math/math_utils_module")
print(mathUtils.add(5, 3))     -- Should print 8
print(mathUtils.power(2, 3))   -- Should print 8
print(mathUtils.divide(10, 0)) -- Should handle error
