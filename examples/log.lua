local signal = require("signal")

local onMessage = signal.new()

onMessage:subscribe(function(message)
    print(string.format("Logged Message: %s", message))
end)

onMessage:call("Hello, world!")
