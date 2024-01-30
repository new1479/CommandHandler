
local cmds = {}

local pf: string = "!"

local lp: userdata = game:GetService("Players").LocalPlayer

local addcmd = function(names: {string}, func: (args: {string}) -> void)

    --[[ 
        assert(type(names) == "table")
        assert(type(func) == "function")
    ]]

    for i, _ in next, names do
        if not cmds[names[i]] then
            cmds[names[i]] = func
        end
    end
end

-- examples
addcmd({"hello", "greet", "sayhello"}, function(args)
    print("Hello, my name is " ..args[1])
end)

addcmd({"args"}, function(args)
    for i = 1, 10 do
        print(args[i])
    end
end)


lp.Chatted:Connect(function(msg)
    local args: {string} = msg:lower():split(" ")

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
