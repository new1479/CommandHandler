local cmds = {}

local pf: string = ">"

local lp: userdata = game:GetService("Players").LocalPlayer

local addcmd = function(names: {string}, func: () -> void)
    for i, _ in next, names do
        if not cmds[names[i]] then
            cmds[names[i]] = func
        end
    end
    return true, names
end

-- example
addcmd({"greet", "sayhello"}, function(args) 
    print(`Hello, my name is {args[1]}`)
end)

lp.Chatted:Connect(function(msg)
    local args: {string} = msg:lower():split(" ")
    if args[1]:sub(1, 1) ~= pf then return end

    local cmd = args[1]:sub(2)

    if cmds[cmd] then
        cmds[cmd](args)
    end
end)
