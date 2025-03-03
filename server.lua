local lapis = require("lapis")
local app = lapis.Application()

app:get("/", function()
  return "simple server in lua"
end)

app:run()
