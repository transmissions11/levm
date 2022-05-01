function split(s, delimiter)
  local result = {}

  for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
    local fixed = match:gsub("\t", "")
    table.insert(result, fixed)
  end

  return result
end

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end
