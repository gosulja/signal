local signal = {}

function signal.new()
    local self = setmetatable({}, {
        __index = signal, 
        __tostring = function() 
            return "SignalClass" 
    end})

    self._events = {}
    return self
end

function signal:subscribe(callback)
    assert(type(callback) == "function", "signal:subscribe callback must be a function.")

    table.insert(self._events, callback)
end

function signal:call(...)
    local args = {...}

    for _, event in pairs(self._events) do 
        local success, err = pcall(event, table.unpack(args))
        if not success then
            error(string.format("signal error: %s", err))
        end
    end
end

function signal:cleanup()
    for i=0, #self._events do 
        self._events[i] = nil 
    end
end

return signal