require "stack"

function split(s, delimiter)
    local result = {}

    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    	local fixed = match:gsub("\t", "")
      table.insert(result, fixed)
    end

    return result
end

function trim(s)
    return (s:gsub("^%s*(.-)%s*$", "%1"))
  end  

local stack = Stack:Create()

function execute(code)
	local lines = split(code, "\n")

	for _, line in pairs(lines) do
		local words = split(line, " ")
		local ins = trim(words[1])

		if ins == "PUSH" then
			stack:push(tonumber(words[2]))
		elseif ins == "POP" then
			stack:pop(1)
		elseif ins == "ADD" then
			local a, b = stack:pop(2)
			stack:push(a + b)
		-- elseif ins == "SUB" then
		-- 	local value1 = pop()
		-- 	local value2 = pop()
		-- 	push(value2 - value1)
		-- elseif ins == "MUL" then
		-- 	local value1 = pop()
		-- 	local value2 = pop()
		-- 	push(value1 * value2)
		-- elseif ins == "DIV" then
		-- 	local value1 = pop()
		-- 	local value2 = pop()
		-- 	push(value2 / value1)
		-- elseif ins == "HALT" then
		-- 	halt()
		end
	end
end

execute([[
PUSH 5
PUSH 3
ADD
PUSH 3
ADD
]])

print(stack:list())
