# A simple fortune in neovim

## Install and usage

Install with any plugin manager and lazyload it since purpose of this plugin is just to provide a function:

```lua
local function footer()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    local str = "   " .. stats.count .. " plugins in " .. ms .. "ms"
    return vim.list_extend({ "", str, "" }, require("fortune").fortune(true))
end
```

If you just need a string, use:
```lua
require("fortune").fortune()
```
