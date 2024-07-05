local signal = require("signal")

local count = 0
local event = signal.new()

event:subscribe(function(type, new)
    if type == "Add" and tonumber(new) then
        count = count + new
        print(count)
    end
end)

-- These event calls will trigger the callbacks
event:call("Add", 5)
event:call("Add", 5)
event:call("Add", 5)

-- Anything past the cleanup wont be called.
event:cleanup()

event:call("Add", 5)
event:call("Add", 5)
event:call("Add", 5)