# Signal.lua

Dispatch and observe events from a data structure, cleanup callbacks with ease.

# Usage

```lua
local signal = require(path_to_signal)

local event = signal.new()

-- Subscribing a callback to the event
event:subscribe(function(eventType)
    assert(type(eventType) == "string", "signal: eventType must be a string")

    if eventType == "PRE" then
        print("Pre event called!")
    elseif eventType == "POST" then
        print("Post event called!")
    end
end)

event:call("PRE")
event:call("POST")

-- When you're done with using the signal, cleanup!
event:cleanup()

```
