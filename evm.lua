require("stack")
require("utils")

-- todo: there should be one evm table that is non-local an can be created

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
    elseif ins == "SUB" then
      local a, b = stack:pop(2)
      stack:push(a - b)
    elseif ins == "MUL" then
      local a, b = stack:pop(2)
      stack:push(a * b)
    elseif ins == "DIV" then
      local a, b = stack:pop(2)
      stack:push(math.floor(b / a))
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

PUSH 3
MUL

PUSH 3
DIV
]])

print(stack:list())
