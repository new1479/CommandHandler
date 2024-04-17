# CommandHandler
- Allows you to have multiple arguments and aliases
- Fairly simple. Designed for noobs, and also so that only you guys can make it even more slower than it already is. haha

Here's some basic examples on how to use the module
```lua
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/new1479/CommandHandler/main/main.lua"))()

api.addcmd({"hello", "greet", "sayhello"}, function(args)
    print("Hello, my name is " ..args[1])
end)
```

Printing the arguments.
```lua
api.addcmd({"args"}, function(args)
    for i = 1, 10 do
        print(args[i])
    end
end)
```

Setting a prefix
defuilt prefix for the command handler is '>' but can be changed using this function
```lua
api.setpf(__PREFIX_HERE__)
```
Here's one last example incase you still don't understand it all
```lua
local api = loadstring(game:HttpGet("https://raw.githubusercontent.com/new1479/CommandHandler/main/main.lua"))()

api.setpf('!')

api.addcmd({"gusername", "gplrname"}, function(args)
    local name = args[1]
    for _, v in pairs(game.Players:GetPlayers()) do
        if string.match(v.name:lower() or v.DisplayName:lower(), name) then
            return v.name
        else
            return nil
        end
    end
end)


--[[
    gusername leghat4445t -> LegHat4445t
    gplrname GAMER34242424 -> GAMER34242424
]] 
```
