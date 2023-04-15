-- main module file
local data = require("data")
local current_file_dir = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h")
local M = {}
M.config = {
  -- default config
  quote_path = current_file_dir .. "/data/data.json",
}

-- setup is the public method to setup your plugin
M.setup = function(args)
  -- you can define your setup function here. Usually configurations can be merged, accepting outside params and
  -- you can also put some validation here for those.
  M.config = vim.tbl_deep_extend("force", M.config, args or {})
end

-- "hello" is a public method for the plugin
M.fortune = function(return_table)
  local quotes = data.read_json_file(M.config.quote_path)
  local random_quote = data.get_random_quote(quotes)
  local quote = '"' .. random_quote.text .. '" - ' .. random_quote.from
  if return_table then
    quote = data.split_string(quote)
  end
  return quote
end

return M
