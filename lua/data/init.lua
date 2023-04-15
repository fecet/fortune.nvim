-- module represents a lua module for the plugin
local M = {}

M.remove_bom = function(content)
  if content:sub(1, 3) == "\239\187\191" then
    return content:sub(4)
  end
  return content
end

M.read_json_file = function(file_path)
  local file = io.open(file_path, "r")
  if file then
    local content = file:read("*all")
    if content then
      content = M.remove_bom(content)
    else
      vim.notify("Cannot found data")
      content = nil
    end
    file:close()
    local json = vim.json
    local quotes = json.decode(content)
    return quotes
  end
end

M.get_random_quote = function(quotes)
  local num_quotes = #quotes
  local math = require("math")
  math.randomseed(os.time())
  local random_index = math.random(num_quotes)
  return quotes[random_index]
end
M.split_string = function(long_string)
  local max_length = 80
  local num_parts = math.ceil(#long_string / max_length)
  local part_length = math.ceil(#long_string / num_parts)

  local parts = {}
  local start_pos = 1
  for i = 1, num_parts do
    local part_end_pos = math.min(start_pos + part_length - 1, #long_string)
    local part = long_string:sub(start_pos, part_end_pos)
    table.insert(parts, part)
    start_pos = part_end_pos + 1
  end
  return parts
end

return M
