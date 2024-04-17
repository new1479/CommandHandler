local cmds = {}

local pf = '>'

local cmds.addcmd = function(...)
    local args = {...}

    if #args ~= 2 then
        return false
    end

    local names = args[1]
    local func = args[2]

    assert(type(names) == "table")
    assert(type(func) == "function")

    for _, name in ipairs(names) do
        if not cmds[name] then
            cmds[name] = func
        end
    end
end

lp.Chatted:Connect(function(msg)
    local args = msg:lower():split(" ")

    if string.sub(args[1], 1, 1) ~= pf then 
        return 
    end

    local check = string.sub(args[1], #pf + 1, #args[1])

    if not cmds[check] then
         return 
    end

    table.remove(args, 1)

    cmds[check](args)
end)

return cmds
