local plugin = require("fortune")

describe("setup", function()
  it("works with default", function()
    -- assert("my first function with param = Hello!", plugin.fortune())
    plugin.fortune()
  end)

  -- it("works with custom var", function()
  --   plugin.setup({ opt = "custom" })
  --   assert("my first function with param = custom", plugin.hello())
  -- end)
end)
