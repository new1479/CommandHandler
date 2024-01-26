local cmds = {}

local pf: string = ">"

local lp: userdata = game:GetService("Players").LocalPlayer

local addcmd = function(names: {string}, description: string, func: () -> void)
    for i, _ in next, names do
        if not cmds[names[i]] then
            cmds[names[i]] = {callback = func, description = description}
        end
    end
    return true, names
end



-- example

addcmd({"Teleport", "to"}, "teleport to a player", function(args)
    local character = lp.Character
    if not character then
        return
    end
    
    local HumanoidRootPart = character:FindFirstChild('HumanoidRootPart')
    if not HumanoidRootPart then
        return
    end
    
    local player = args[1]
    if player == lp then
         return
    end
    
    local player = game:GetService('Players'):FindFirstChild(args[1])
    local character = player and player.Character and player.Character:FindFirstChild('HumanoidRootPart')
    
    if character then
         HumanoidRootPart:PivotTo(character.CFrame)
    end
end)

addcmd({"greet", "sayhello"}, "tp", function(args) 
    print(`Hello, my name is {args[1]}`)
end)

TextChatService.OnIncomingMessage:Connect(function(msg)
    local args: {string} = msg:lower():split(" ")
    if args[1]:sub(1, 1) ~= pf then return end

    local cmd = args[1]:sub(2)

    if cmds[cmd] and cmd[cmd].callback then
        cmds[cmd].callback(args)
    end
end)
