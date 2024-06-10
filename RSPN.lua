local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "RSPN'S Streamer Tool", HidePremium = false, SaveConfig = false, ConfigFolder = "RSPN", IntroEnabled = true, IntroText = "RSPN", IntroIcon = "https://cdn.discordapp.com/attachments/1196998381495668826/1214713220972027955/RSPN_New_BW.png?ex=65fa1cd8&is=65e7a7d8&hm=f36983cb2c51723946740aae9d09e8880ccc3122d6760b1a826499ee4c3f3572&", Icon = "https://cdn.discordapp.com/attachments/1196998381495668826/1214713220972027955/RSPN_New_BW.png?ex=65fa1cd8&is=65e7a7d8&hm=f36983cb2c51723946740aae9d09e8880ccc3122d6760b1a826499ee4c3f3572&"})
 
--Football Fusion
local Tab = Window:MakeTab({
	Name = "Football Fusion",
	Icon = "rbxassetid://",
	PremiumOnly = false
})
local Section = Tab:AddSection({
	Name = "Important"
})

--[[
Name = <string> - The name of the section.
]]
Tab:AddButton({
	Name = "Anti-Ban (Update TBD)",
	Callback = function()
        repeat wait() until game:IsLoaded()
        print('Initialized')
        if game.PlaceId == 8204899140 then
            local Players = game:GetService("Players")
        
            --local NewHash = ""
            --local CurrentHash = ""
            local UpdatedVersion = 212
            local WhitelistedSeq = {
                [1] = {
                    [1] = 655, --// [number]
                    [2] = 775, --// [number]
                    [3] = 724, --// [number]
                    [4] = 633, --// [number]
                    [5] = 891 --// [number]
                }, --// table: 0x000000005324f5c9 [table]
                [2] = {
                    [1] = 760, --// [number]
                    [2] = 760, --// [number]
                    [3] = 771, --// [number]
                    [4] = 665, --// [number]
                    [5] = 898 --// [number]
                }, --// table: 0x000000005e818c89 [table]
                [3] = {
                    [1] = 660, --// [number]
                    [2] = 759, --// [number]
                    [3] = 751, --// [number]
                    [4] = 863, --// [number]
                    [5] = 771 --// [number]
                } --// table: 0x000000008053a989 [table]
            } --// table: 0x0000000043132109 [table]
            
            --[[local Booleans = {  --// Detection Booleans
                [1] = false; --// Metatable (Sequence) Indexing
                [2] = false; --// Checks for illegal images in coregui?
                [3] = false; --// Teleporting
                [4] = false; --// Humanoid Modifications (HipHeight, WalkSpeed, JumpPower, UseJumpPower)
                [5] = false; --// Changing Size (Catch, HumanoidRootPart)
                --// bools 6-19 don't neccesarilly trigger bans and are linked to other bools (1-5 & 20-22)
                [6] = true;
                [7] = true;
                [8] = true;
                [9] = true;
                [10] = true;
                [11] = true;
                [12] = true;
                [13] = true;
                [14] = true;
                [15] = true;
                [16] = true;
                [17] = true;
                [18] = true;
                [19] = true;
                --// end of links :)
                [20] = false; --// Football Modification
                [21] = false; --// Changing Gravity
                [22] = false; --// Seems to control if parts of the ac is disabled? (true = disable, false = enable)
            }]]
            
            local BooleanIndex = {
                [1] = 17;
                [2] = 19;
                [3] = 41;
                [4] = 44;
                [5] = 10;
                --// Links
                [6] = 28;
                [7] = 29;
                [8] = 30;
                [9] = 31;
                [10] = 32;
                [11] = 33;
                [12] = 34;
                [13] = 35;
                [14] = 36;
                [15] = 37;
                [16] = 38;
                [17] = 39;
                [18] = 9;
                [19] = 11;
                --// End of Links
                [20] = 40;
                [21] = 43;
                [22] = 18;
            }
            
            local BoolReasons = {
                [1] = "Metatable (Sequence) Indexing";
                [2] = "Illegal Image in CoreGui";
                [3] = "Teleporting";
                [4] = "Humanoid Modification";
                [5] = "Size Modification";
                --// Links
                [6] = "Link";
                [7] = "Link";
                [8] = "Link";
                [9] = "Link";
                [10] = "Link";
                [11] = "Link";
                [12] = "Link";
                [13] = "Link";
                [14] = "Link";
                [15] = "Link";
                [16] = "Link";
                [17] = "Link";
                [18] = "Link";
                [19] = "Link";
                --// End of Links
                [20] = "Football Moditification";
                [21] = "Gravity Modification";
                [22] = "AC Disabled";
            }
            
            local CurrentBools;
            local SequenceLinks = {}
            local MainFunction;
            
            local BlacklistNumber = Random.new():NextNumber(-9e5, 9e5)
            
            local _DEBUGGING = false
            local RemoteEvent;
            local ReadyForExecution = false
            local ProblemEncountered = false
            local BypassVerified = false
            
            if getgenv().BypassInitiated then
                return;
            end
            
            getgenv().BypassInitiated = true
            
            local function UpdateBools()
                local Upvalues = getupvalues(MainFunction)
            
                CurrentBools = {}
            
                for i, v in next, BooleanIndex do
                    if Upvalues[v] ~= nil then
                        CurrentBools[i] = Upvalues[v]
                    elseif not ProblemEncountered then
                        task.spawn(messagebox, "A problem has been encountered while trying to bypass. Please report this error message to the developers:\nTBP:BUF-UnK", "Problem Encountered", 1)
                        game:Shutdown()
                    end
                end
            end
            
            local function GetLinkedSequence(Sequence, Function)
                if not MainFunction then
                    return;
                end
            
                local SeqHash = 1;
            
                for _, v in next, Sequence do
                    SeqHash *= v
                end
            
                if Function == MainFunction then
                    return "AC Fail-Safe" --// Main ac function is trying to ban us, it's a fail-safe triggered by (a) boolean(s) being true
                end
            
                if SequenceLinks[SeqHash] then
                    return (BoolReasons[SequenceLinks[SeqHash]] or "Unknown") .. " (Cached)"
                end
            
                local DiffBool;
                local Upvalues = getupvalues(MainFunction)
            
                local NewBools = {}
            
                for i, v in next, BooleanIndex do
                    NewBools[i] = Upvalues[v]
                end
            
                for i, v in next, NewBools do
                    if v ~= CurrentBools[i] then
                        DiffBool = i
                    end
                end
            
                local LinkedSequence = BoolReasons[DiffBool] or "Unknown"
            
                if DiffBool then
                    setupvalue(MainFunction, BooleanIndex[DiffBool], CurrentBools[DiffBool])
                end
            
                SequenceLinks[SeqHash] = DiffBool or 0/0;
                CurrentBools = NewBools
            
                return LinkedSequence
            end
            
            local function Debug(Method, ...)
                if _DEBUGGING then
                    getgenv()[Method](...)
                end
            end
            
            local FormatTable = function()
                return;
            end
            
            if _DEBUGGING then
                FormatTable = loadstring(game:HttpGet("https://raw.githubusercontent.com/NoTwistedHere/Roblox/main/FormatTable.lua"))() --// FormatTable :)
            end
            
            local function IsValidSequence(Sequence)
                for _, v in next, WhitelistedSeq do
                    local Valid = 0
            
                    for i, k in next, v do
                        if Sequence[i] == k then
                            Valid += 1
                        end
                    end
            
                    if Valid == 5 then
                        return true
                    end
                end
            
                return false
            end
            
            local function SetMetatable(Meta)
                local Func = getrawmetatable(Meta).__call
                local FEnv = getrawmetatable(getfenv(Func)).__index
            
                setreadonly(FEnv.debug, false)
            
                FEnv.debug.info = function() --// SW is bitch for this
                    return "You're a faggot of a LocalScript" --// Bypass caller check
                end
            
                setreadonly(FEnv.debug, true)
            
                local HookedAt = os.clock()
                local Logging;
                local LogCount = 0
                local CompletedCycles = 0
            
                getrawmetatable(Meta).__call = function(...)
                    local Arguments = {...}
                    local Table = table.remove(Arguments, 1) --// self
                    local Caller = getinfo(2).func
            
                    if not CurrentBools then
                        local CallerInfo = getinfo(Caller)
            
                        if CallerInfo.numparams == 3 and CallerInfo.nups > 40 and CallerInfo.is_vararg == 0 then
                            MainFunction = Caller
                            UpdateBools()
                        end
                    end
            
                    if not IsValidSequence(Arguments) then
                        if (os.clock() - HookedAt < 1 or #WhitelistedSeq == 0) and not Logging and CompletedCycles == 0 and not ProblemEncountered and not ReadyForExecution then --// Most likely the ac has updated
                            Debug("warn", "[AUTO UPDATING BYPASS SEQUENCES] - STARTING")
            
                            Logging = true
                            WhitelistedSeq = {}
                        end
            
                        if not Logging then
                            Debug("warn", "Blocked: ", FormatTable({
                                ["Suspected Ban Reason"] = GetLinkedSequence(Arguments, getinfo(2).func);
                                ["Sequence"] = Arguments;
                            }))
            
                            return BlacklistNumber
                        else
                            if Caller == MainFunction then
                                Debug("warn", "Whitelisted", FormatTable(Arguments))
                                table.insert(WhitelistedSeq, Arguments)
                            else
                                Debug("warn", "Unexpected function tried updating mt while whitelisting")
                            end
                        end
                    elseif Logging then
                        LogCount += 1
            
                        if LogCount >= #WhitelistedSeq then --// This should only take a few cycles
                            CompletedCycles += 1
            
                            if CompletedCycles > 2 then
                                Debug("warn", "[AUTO UPDATING BYPASS SEQUENCES] - COMPLETE")
            
                                Logging = false
                            end
                        elseif CompletedCycles > 0 then
                            CompletedCycles -= 1
                        end
                    end
            
                    if not Logging then
                        ReadyForExecution = true
                    end
            
                    --Debug("print", "not blocked", FormatTable(Arguments))
            
                    return Func(...)
                end
            end
            
            repeat
                task.wait()
            until Players.LocalPlayer and Players.LocalPlayer.Character
            
            task.delay(8, function() --// If the bypass hasn't successfully executed by now, kick the player or shutdown the game
                if not ReadyForExecution and not ProblemEncountered then
                    if not ProblemEncountered then
                        task.spawn(messagebox, "A problem has been encountered while trying to bypass. Please report this error message to the developers:\nTBP:ExT-8", "Problem Encountered", 1)
                        game:Shutdown()
                    end
                end
            end)
            
            --[[local function GetGameHash(Function)
                local Source = getinfo(Function).source
                local Raw = ""
            
                for i, v in next, getreg() do
                    if type(v) == "function" and getinfo(v).source == Source then
                        local Info = getinfo(v)
                        local Constants = getconstants(v)
                        local FS = "#@C:"
            
                        for i, v in next, Constants do
                            if type(v) == "string" then
                                FS ..= i.."-"..v.."~"
                            end
                        end
            
                        FS ..= "@I:"..Info.nups.."~"..Info.name.."~"..Info.currentline.."~"..Info.numparams
            
                        Raw ..= FS
                    end
                end
            
                return Hash(Raw)
            end]]
            
            for _, v in next, getconnections(Players.LocalPlayer.Character.ChildAdded) do --// Loop through connections and grab the upper level character detections func
                if v.Function then
                    local FInfo = getinfo(v.Function)
                    
                    if FInfo.nups == 9 then
                        --// Party
            
                        --[[NewHash = GetGameHash(v.Function)
            
                        if NewHash ~= CurrentHash then
                            Debug("warn", "Game has updated, updating bypass")
                            WhitelistedSeq = {}
                        end]]
            
                        if game.PlaceVersion ~= UpdatedVersion then
                            Debug("warn", "Game has updated, updating bypass")
                            WhitelistedSeq = {}
                        else
                            Debug("warn", "Game has NOT updated")
                        end
            
                        RemoteEvent = getupvalue(v.Function, 8) --// Ban RE
                        SetMetatable(getupvalue(v.Function, 9)) --// new_mt :>)
            
                        Debug("warn", "Grabbed RemoteEvent & Metatable")
                    end
                end
            end
            
            --// Hook FireServer & block blacklisted sequences from firing
            
            local OldHook; OldHook = hookfunction(RemoteEvent.fireServer, function(...) --// Hook FireServer (fireServer & FireServer direct to the same function)
                local Arguments = {...}
                local self = table.remove(Arguments, 1)
            
                if typeof(self) == "Instance" and self == RemoteEvent and type(Arguments[1]) == "string" and Arguments[1]:sub(1, 2) == "AC" then
                    Debug("print", "FireServer request", FormatTable(Arguments))
            
                    for _, v in next, Arguments do
                        if (type(v) == "number" and v == BlacklistNumber) or (type(v) == "string" and v == "error") then
                            Debug("warn", "BLACKLISTED SEQ TRIED TO RUN")
            
                            return; --// Block blacklisted sequences from being sent
                        end
                    end
            
                    Debug("print", "FireServer sent", FormatTable(Arguments))
                end
            
                return OldHook(...)
            end)
            
            local OldNamecall; OldNamecall = hookmetamethod(game, "__namecall", function(...)
                local Arguments = {...}
                local self = table.remove(Arguments, 1)
                local Method = getnamecallmethod()
            
                if (Method == "FireServer" or Method == "fireServer") and typeof(self) == "Instance" and self == RemoteEvent and type(Arguments[1]) == "string" and Arguments[1]:sub(1, 2) == "AC" then
                    Debug("print", "FireServer request", FormatTable(Arguments))
            
                    if not BypassVerified then
                        if not Arguments[2] then
                            Debug("warn", "Arguments[2] is nil, this is a problem")
                            ProblemEncountered = true
                            
                            pcall(function()
                                task.spawn(messagebox, "A problem has been encountered while trying to bypass. Please report this error message to the developers:\nTBP:BVF-AG2N", "Problem Encountered", 1)
                                game:Shutdown()
                            end)
                        elseif type(Arguments[2]) == "table" and ReadyForExecution then
                            BypassVerified = true
                        end
                    end
            
                    for _, v in next, Arguments do
                        if (type(v) == "number" and v == BlacklistNumber) or (type(v) == "string" and v == "error") then
                            Debug("warn", "BLACKLISTED SEQ TRIED TO RUN")
            
                            return; --// Block blacklisted sequences from being sent
                        end
                    end
            
                    Debug("print", "FireServer sent", FormatTable(Arguments))
                end
            
                return OldNamecall(...)
            end)
            
            local OldDelay; OldDelay = hookfunction(delay, function(...) --// 'WhY uSe ElIpSeS iNsTeAd Of PaRaMs' - 1) stfu 2) to prevent scripts from intentionally causing an error (some errors can be caused by using defined params)
                local _, Function = ...
            
                if type(Function) == "function" and getinfo(Function).source:match("PlayerModule.LocalScript") then
                    return; --// Block the function from being called
                end
            
                return OldDelay(...)
            end)
            
            repeat
                task.wait()
            until ReadyForExecution
            
            repeat
                task.wait()
            until BypassVerified
            
            Debug("warn", "[READY FOR EXECUTION]")
            
            if _DEBUGGING then
                Debug("warn", "Dumping sequences & current hash to clipboard")
                setclipboard(FormatTable({
                    Sequences = WhitelistedSeq;
                    --Hash = NewHash
                    PlaceVersion = game.PlaceVersion;
                }))
            end
        
            getgenv().AC_BYPASS_DONE = true
        end
  	end    
})
local Section = Tab:AddSection({
	Name = "Scorebug"
})

Tab:AddButton({
	Name = "Clock Sync (CSV)",
	Callback = function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
local mainGui = playerGui:WaitForChild("MainGui")
local scoreboard = mainGui:WaitForChild("Scoreboard")
local Message = scoreboard.Parent:WaitForChild("Message")
        
        scoreboard.Position = UDim2.new(1, 0, -0.02, 0)
        
        local fileName = "LFG-FF.csv"
        
        local function updateData()
            local clock = scoreboard.Clock.Text
            local pclock = scoreboard.Playclock.TextLabel.Text
            local status = scoreboard.Status.Text
            local homescore = scoreboard.HomeScore.TextLabel.Text
            local awayscore = scoreboard.AwayScore.TextLabel.Text
            local fgYards = tonumber(scoreboard.Yardline.Text) + 17
            local yardline = Message.Text
        
            local data = string.format("%s,%s,%s,%s,%s,%s\n", clock, pclock, status, homescore, awayscore, yardline, fgYards)
            writefile(fileName, data)
        end
        
        updateData()
        
        game.RunService.Stepped:Connect(function()
            Message.Font = Enum.Font.JosefinSans
            Message.TextColor3 = Color3.fromRGB(255, 255, 255)
            Message.TextScaled = false
            Message.TextSize = 65.000
            Message.TextWrapped = true
            Message.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        
            local Logo = Message.Parent.Transition.NameLogo
            local Replay = Message.Parent.Transition.Message
        
            Logo.ImageColor3 = Color3.fromRGB(155, 0, 255)
            if Message.Parent:FindFirstChild("ReplayDetails") then
                Message.Parent.ReplayDetails:Destroy()
            end
        end)
        
        scoreboard.Clock:GetPropertyChangedSignal("Text"):Connect(updateData)
        scoreboard.Yardline:GetPropertyChangedSignal("Text"):Connect(updateData)
        scoreboard.Status:GetPropertyChangedSignal("Text"):Connect(updateData)
        scoreboard.Playclock.TextLabel:GetPropertyChangedSignal("Text"):Connect(updateData)
        scoreboard.HomeScore.TextLabel:GetPropertyChangedSignal("Text"):Connect(updateData)
        scoreboard.AwayScore.TextLabel:GetPropertyChangedSignal("Text"):Connect(updateData)
        
  	end    
})

Tab:AddButton({
	Name = "Clock Sync (TXT)",
	Callback = function()
        local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")
local mainGui = playerGui:WaitForChild("MainGui")
local scoreboard = mainGui:WaitForChild("Scoreboard")
local Message = scoreboard.Parent:WaitForChild("Message")

scoreboard.Position = UDim2.new(1, 0, -0.02, 0)

local function writeData(fileName, data)
    writefile(fileName, data)
end

local function updateData()
    local clock = scoreboard.Clock.Text
    local pclock = scoreboard.Playclock.TextLabel.Text
    local status = scoreboard.Status.Text
    local homescore = scoreboard.HomeScore.TextLabel.Text
    local awayscore = scoreboard.AwayScore.TextLabel.Text
    local fgYards = tonumber(scoreboard.Yardline.Text) + 17
    local yardline = Message.Text

    writeData("clock.txt", clock)
    writeData("pclock.txt", pclock)
    writeData("status.txt", status)
    writeData("homescore.txt", homescore)
    writeData("awayscore.txt", awayscore)
    writeData("fgYards.txt", tostring(fgYards))
    writeData("yardline.txt", yardline)
end

updateData()

RunService.Stepped:Connect(function()
    Message.Font = Enum.Font.JosefinSans
    Message.TextColor3 = Color3.fromRGB(255, 255, 255)
    Message.TextScaled = false
    Message.TextSize = 65.000
    Message.TextWrapped = true
    Message.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)

    local Logo = Message.Parent.Transition.NameLogo
    local Replay = Message.Parent.Transition.Message

    Logo.ImageColor3 = Color3.fromRGB(155, 0, 255)
    if Message.Parent:FindFirstChild("ReplayDetails") then
        Message.Parent.ReplayDetails:Destroy()
    end
end)

scoreboard.Clock:GetPropertyChangedSignal("Text"):Connect(updateData)
scoreboard.Yardline:GetPropertyChangedSignal("Text"):Connect(updateData)
scoreboard.Status:GetPropertyChangedSignal("Text"):Connect(updateData)
scoreboard.Playclock.TextLabel:GetPropertyChangedSignal("Text"):Connect(updateData)
scoreboard.HomeScore.TextLabel:GetPropertyChangedSignal("Text"):Connect(updateData)
scoreboard.AwayScore.TextLabel:GetPropertyChangedSignal("Text"):Connect(updateData)
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
	Name = "Stadiums"
})

Tab:AddButton({
	Name = "XFG Championship 20 Stadium (for slang)",
	Callback = function()
-- Replace these values with your actual asset ID
local selectedAssetId = "17799836832"

-- Function to replace model named "Stadium" with the selected asset ID
local function replaceStadiumWithAsset()
    local game = game
    local workspace = game:GetService("Workspace")

    -- Iterate through each descendant of Workspace
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("Model") and descendant.Name == "Stadium" then
            -- Remove existing Stadium model
            descendant:Destroy()

            -- Create new model using the selected asset ID
            local assetModel = game:GetObjects("rbxassetid://" .. selectedAssetId)[1]
            if assetModel then
                assetModel.Parent = workspace
                print("Stadium model replaced with asset ID:", selectedAssetId)
            else
                warn("Failed to load asset with ID:", selectedAssetId)
            end
        end
    end
end

-- Call the function to replace Stadium with the selected asset
replaceStadiumWithAsset()  
})

Tab:AddButton({
	Name = "Environment",
	Callback = function()
      		OrionLib:MakeNotification({
	Name = "Script not added",
	Content = "Currently it's not added, but maybe soon this will be a stadium or the actual environment.",
	Image = "rbxassetid://4483345998",
	Time = 5
})
  	end    
})

local Section = Tab:AddSection({
	Name = "Camera Systems (Not working with Solara)"
})
Tab:AddButton({
    Name = "Auto Camera",
    Callback = function()
        local renderstep = game:GetService("RunService").RenderStepped


        local coreGuis = {
        Backpack = true,
        Chat = true,
        Health = true,
        PlayerList = true,
        }
        
        local screenGuis = {}
        
        local setCores = {
        BadgesNotificationsActive = true,
        PointsNotificationsActive = true,
        }
        
        local StarterGui = game:GetService("StarterGui")
        
        
        print("test")
        
        local cam = workspace.CurrentCamera
        local player = game:GetService("Players").LocalPlayer
        local FocusPart = game:GetService("ReplicatedStorage").Values.Ball.Value
        local focusPartFar
        local focusPartFov
        local enabled = false
        
        local position = Vector3.new(0, 70, -320)
        
        renderstep:connect(function()
        if (enabled == true) then
        FocusPart = game:GetService("ReplicatedStorage").Values.Ball.Value
        
        
        
        if (FocusPart ~= nil) then
        focusPartFar = (position - FocusPart.Position).Magnitude
        
        
        focusPartFov = (50-((focusPartFar/10)*2))+(FocusPart.Position.Y/1.7)
        if (focusPartFov < 7) then
            focusPartFov = 7
        end
        if (focusPartFov > 35) then
            focusPartFov = 35
        end
        cam.CameraType = "Scriptable"
        if (FocusPart.Position.Y < 0) then
        else
        cam.CFrame = CFrame.new(position, FocusPart.Position)
        cam.FieldOfView = focusPartFov
        end
        end
        
        end
        end)
        
        game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
            
            if key == "1" then
                position = Vector3.new(0, 70, -320)
            end
            if key == "2" then
                position = Vector3.new(0, 70, 320)
            end
            if key == "3" then
                position = Vector3.new(80, 10, 200)
            end
            if key == "4" then
                position = Vector3.new(-80, 10, -200)
            end
            if key == "5" then
                position = Vector3.new(-120, 10, 75)
            end
            if key == "6" then
                position = Vector3.new(120, 10, -75)
            end
            if key == "7" then
                position = Vector3.new(0, 40, 75)
            end
            if key == "8" then
                position = Vector3.new(0, 40, -75)
            end				
            
        end)
        
        
        game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
            
            if key == "z" then
                if (enabled == true) then
                    enabled = false
                    
                    local playergui = game:GetService("Players").LocalPlayer.PlayerGui
                    if playergui then
                    for _, gui in pairs(screenGuis) do
                    if gui:IsA("ScreenGui") then
                    gui.Enabled = true
                    screenGuis = {}
                    end
                    end
                    end
                    
                    for name in pairs(setCores) do
                    setCores[name] = StarterGui:GetCore(name)
                    StarterGui:SetCore(name, true)
                    end
                    
                    for name in pairs(coreGuis) do
                    coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
                    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], true)
                    end
                    
                    cam.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
                    cam.CameraType = "Custom"
                    cam.CFrame = game:GetService("Players").LocalPlayer.Character.Head.CFrame
                    cam.FieldOfView = 70
                    
                else
                
                    enabled = true
                    
                    local playergui = game:GetService("Players").LocalPlayer.PlayerGui
                    if playergui then
                    for _, gui in pairs(playergui:GetChildren()) do
                    if gui:IsA("ScreenGui") and gui.Enabled then
                    gui.Enabled = false
                    screenGuis[#screenGuis + 1] = gui
                    end
                    end
                    end
                    
                    for name in pairs(setCores) do
                    setCores[name] = StarterGui:GetCore(name)
                    StarterGui:SetCore(name, false)
                    end
                    
                    for name in pairs(coreGuis) do
                    coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
                    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
                    end
                    
                end
                
            end
            
        end)
        
      end
})

Tab:AddButton({
    Name = "Broadcast Camera",
    Callback = function()
        local renderstep = game:GetService("RunService").RenderStepped


        local coreGuis = {
        Backpack = true,
        Chat = true,
        Health = true,
        PlayerList = true,
        }
        
        local screenGuis = {}
        
        local setCores = {
        BadgesNotificationsActive = true,
        PointsNotificationsActive = true,
        }
        
        local prePlayFOV = 0
        local prePlayZoom
        local inPlayZoom
        local oldStatus = game:GetService("ReplicatedStorage").Values.Status.Value
        local StarterGui = game:GetService("StarterGui")
        
        
        print("test")
        
        local cam = workspace.CurrentCamera
        local player = game:GetService("Players").LocalPlayer
        local FocusPart = game:GetService("ReplicatedStorage").Values.Ball.Value
        local focusPartFar
        local focusPartFov
        local enabled = false
        
        local position = Vector3.new(-180, 60, 0)
        
        renderstep:connect(function()
        if (game:GetService("ReplicatedStorage").Values.Status.Value ~= oldStatus) then
            
            
            if (game:GetService("ReplicatedStorage").Values.YardTag.Value < 25) then
                if (game:GetService("Workspace").LineTogo.Position.Z > 0) then
                    position = Vector3.new(-180, 60, 75)
                else
                    position = Vector3.new(-180, 60, -75)
                end
            else
                position = Vector3.new(-180, 60, 0)
            end
            
            
            print("not equal")
            oldStatus = game:GetService("ReplicatedStorage").Values.Status.Value
            print(oldStatus)
            if (oldStatus == "PrePlay") then
                prePlayFOV = 15
                prePlayZoom = true
            end
            if (oldStatus == "InPlay") then
                repeat
                    if (prePlayZoom == false) then
                        prePlayFOV = 10
                        inPlayZoom = true
                    end
                    wait(0.2)
                until (prePlayZoom == false)
            end
            
        end
        
        if (prePlayZoom == true) then
            prePlayFOV = prePlayFOV-0.01
            if (prePlayFOV <= 10) then
                prePlayZoom = false
                prePlayFOV = 10
            end
        end
        
        if (inPlayZoom == true) then
            prePlayFOV = prePlayFOV-0.01
            if (prePlayFOV <= 0) then
                inPlayZoom = false
                prePlayFOV = 0
            end
        end
        
        print(prePlayFOV)
        
        
        if (enabled == true) then
        FocusPart = game:GetService("ReplicatedStorage").Values.Ball.Value
        
        
        
        if (FocusPart ~= nil) then
        focusPartFar = (position - FocusPart.Position).Magnitude
        
        
        focusPartFov = (50-((focusPartFar/10)*2))+(FocusPart.Position.Y/1.7)+prePlayFOV
        if (focusPartFov < 7) then
            focusPartFov = 7
        end
        if (focusPartFov > 35) then
            focusPartFov = 35
        end
        cam.CameraType = "Scriptable"
        if (FocusPart.Position.Y < 0) then
        else
        cam.CFrame = CFrame.new(position, FocusPart.Position)
        cam.FieldOfView = focusPartFov
        end
        end
        
        end
        end)
        
        
        game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(key)
            
            if key == "z" then
                if (enabled == true) then
                    enabled = false
                    
                    local playergui = game:GetService("Players").LocalPlayer.PlayerGui
                    if playergui then
                    for _, gui in pairs(screenGuis) do
                    if gui:IsA("ScreenGui") then
                    gui.Enabled = true
                    screenGuis = {}
                    end
                    end
                    end
                    
                    for name in pairs(setCores) do
                    setCores[name] = StarterGui:GetCore(name)
                    StarterGui:SetCore(name, true)
                    end
                    
                    for name in pairs(coreGuis) do
                    coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
                    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], true)
                    end
                    
                    cam.CameraSubject = game:GetService("Players").LocalPlayer.Character.Humanoid
                    cam.CameraType = "Custom"
                    cam.CFrame = game:GetService("Players").LocalPlayer.Character.Head.CFrame
                    cam.FieldOfView = 70
                    
                else
                
                    enabled = true
                    
                    local playergui = game:GetService("Players").LocalPlayer.PlayerGui
                    if playergui then
                    for _, gui in pairs(playergui:GetChildren()) do
                    if gui:IsA("ScreenGui") and gui.Enabled then
                    gui.Enabled = false
                    screenGuis[#screenGuis + 1] = gui
                    end
                    end
                    end
                    
                    for name in pairs(setCores) do
                    setCores[name] = StarterGui:GetCore(name)
                    StarterGui:SetCore(name, false)
                    end
                    
                    for name in pairs(coreGuis) do
                    coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
                    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
                    end
                    
                end
                
            end
            
        end)
        
      end
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
	Name = "Extra"
})
Tab:AddButton({
	Name = "Marker",
	Callback = function()
      		
local oldStatus = "none"
local oldScrimmage = 0
local arrow = ">"
local part = Instance.new("Part",game:GetService("Workspace"))
local surfaceGUI = Instance.new("SurfaceGui",part)
local textLabel = Instance.new("TextLabel",surfaceGUI)
local meshPart = Instance.new("MeshPart",game:GetService("Workspace"))
local meshOutline = Instance.new("MeshPart",game:GetService("Workspace"))


-- Set Home Team Colors

local homeTeamMain = "#000000"
local homeTeamOutline = "#000000"

-- Set Away Team Colors

local awayTeamMain = "#000000"
local awayTeamOutline = "#000000"



repeat wait() until game:IsLoaded()
part.Anchored = true
part.Position = Vector3.new(-27, 2.8, 25)
part.Size = Vector3.new(40, 1, 40)
part.Transparency = 1
part.Rotation = Vector3.new(0, 0, 0)
surfaceGUI.Face = 1
surfaceGUI.CanvasSize = Vector2.new(200, 200)
textLabel.Parent = surfaceGUI
textLabel.Text = "1st & 15 >"
textLabel.TextSize = 25
textLabel.Font = 4
textLabel.Rotation = 0
textLabel.TextColor3 = Color3.fromHex("#000000")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextTransparency = 0.3

meshPart.MeshId = "rbxassetid://8237126683"
meshPart.Size = Vector3.new(2, 1.2, 1.6)
meshPart.Position = Vector3.new(24, 3.1, 25)
meshPart.Anchored = true
meshPart.BrickColor = BrickColor.new (Color3.fromHex("#000000"))
meshPart.Transparency = 0.5
meshPart.CastShadow = false
meshPart.Reflectance = 0
meshPart.Rotation = Vector3.new(0, 0, 0)

meshOutline.MeshId = "rbxassetid://8237953613"
meshOutline.Size = Vector3.new(2, 1.2, 1.6)
meshOutline.Position = Vector3.new(0, 3.1, 25)
meshOutline.Anchored = true
meshOutline.BrickColor = BrickColor.new (Color3.fromHex("#000000"))
meshOutline.Transparency = 0.5
meshOutline.CastShadow = false
meshOutline.Reflectance = 0

while wait(1) do
	homeTeamOutline = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Scoreboard.Home.BackgroundColor3
	awayTeamOutline = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Scoreboard.Away.BackgroundColor3
--if (game:GetService("Workspace").LineDown.Transparency == 0) then
   -- textLabel.TextTransparency = 0
if (game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Scoreboard.Status.Text ~= oldStatus) then
    oldStatus = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Scoreboard.Status.Text
    if (game:GetService("Workspace").LineDown.Position.Z > game:GetService("Workspace").LineTogo.Position.Z) then
        arrow = ">"
    else
        arrow = "<"
   end
    if (arrow == "<") then
    textLabel.Text = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Scoreboard.Status.Text
    meshPart.Rotation = Vector3.new(0, 0, 0)
    meshOutline.Rotation = Vector3.new(0, 0, 0)
    else
    textLabel.Text = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Scoreboard.Status.Text 
    meshPart.Rotation = Vector3.new(0, 180, 0)
    meshOutline.Rotation = Vector3.new(0, 180, 0)
    end
    
    if (game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Scoreboard.Status.Text == "KICKOFF") then
        textLabel.TextTransparency = 1
        meshPart.Transparency = 1
        meshOutline.Transparency = 1
    else
        textLabel.TextTransparency = 0.5
        meshPart.Transparency = 0.5
        meshOutline.Transparency = 0.7
    end  
    x = string.sub(oldStatus,1,3)
    	
    
    
	if (x == "4th") then
		meshOutline.BrickColor = BrickColor.new (Color3.fromHex("#FF0000"))
		textLabel.TextColor3 = Color3.fromHex("#FF0000")
	else
		meshOutline.BrickColor = BrickColor.new (Color3.fromHex("#000000"))
		textLabel.TextColor3 = Color3.fromHex("#FFFFFF")
	end			
end
if (game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Scoreboard.Home.Poss.Visible == true) then
    	print("test")
    	meshPart.BrickColor = BrickColor.new (Color3.fromHex("#000000"))
    	meshOutline.BrickColor = BrickColor.new (homeTeamOutline)
    else
    print("test222")
		meshPart.BrickColor = BrickColor.new (Color3.fromHex("#000000"))
    	meshOutline.BrickColor = BrickColor.new (awayTeamOutline)
	end
if (game:GetService("Workspace").LineDown.Position.Z ~= oldScrimmage) then
    print("not equal")
    oldScrimmage = game:GetService("Workspace").LineDown.Position.Z
    part.Position = Vector3.new(25, 2.8, game:GetService("Workspace").LineDown.Position.Z)
    meshPart.Position = Vector3.new(25, 3.1, game:GetService("Workspace").LineDown.Position.Z)
    meshOutline.Position = Vector3.new(25, 3.1, game:GetService("Workspace").LineDown.Position.Z)
end    
--else
  -- print("test")
  --  textLabel.TextTransparency = 1
--end
end
  	end    
})

Tab:AddButton({
	Name = "Ambient (for dark stadiums)",
	Callback = function()
local Lighting = game:GetService("Lighting")

Lighting.Ambient = Color3.fromRGB(255, 255, 255)
  	end    
})
						
Tab:AddButton({
	Name = "Field Decals (ask @aidanzworld to update)",
	Callback = function()
local endZone1Grass = game:GetService("Workspace").Models.Field.Grass.Endzone.One
local endZoneOneDecal = Instance.new("Decal", endZone1Grass)

local endZone2Grass = game:GetService("Workspace").Models.Field.Grass.Endzone.Two
local endZoneTwoDecal = Instance.new("Decal", endZone2Grass)

-- TEAM ONE ENDZONE COLOR + LOGO
endZone1Grass.Color = Color3.fromRGB(0, 51, 160)
endZoneOneDecal.Face = Enum.NormalId.Top
endZoneOneDecal.Texture = "rbxassetid://17799501216"

if endZone1Grass:FindFirstChild("SurfaceGui") then
    endZone1Grass.SurfaceGui:Destroy()
end

-- TEAM TWO ENDZONE COLOR + LOGO
endZone2Grass.Color = Color3.fromRGB(253, 181, 21)
endZoneTwoDecal.Face = Enum.NormalId.Top
endZoneTwoDecal.Texture = "rbxassetid://17799615397"

if endZone2Grass:FindFirstChild("SurfaceGui") then
    endZone2Grass.SurfaceGui:Destroy()
end

local middleLogo = game:GetService("Workspace").Models.Field.Grass.Normal.Mid.SurfaceGui.ImageLabel
middleLogo.Image = "rbxassetid://17799582315"
middleLogo.ImageTransparency = 0
middleLogo.ScaleType = Enum.ScaleType.Fit
  	end    
})
						
-- HCBB

local Tab = Window:MakeTab({
	Name = "HCBB",
	Icon = "rbxassetid://",
	PremiumOnly = false
})
Tab:AddButton({
    Name = "Camera System",
    Callback = function()
        local renderstep = game:GetService("RunService").RenderStepped

        local coreGuis = {
            Backpack = true,
            Chat = true,
            Health = true,
            PlayerList = true,
        }

        local screenGuis = {}

        local setCores = {
            BadgesNotificationsActive = true,
            PointsNotificationsActive = true,
        }

        local StarterGui = game:GetService("StarterGui")

        print("test")

        local cam = workspace.CurrentCamera
        local player = game:GetService("Players").LocalPlayer
        local FocusPart = game:GetService("Workspace").Plates.HomePlate.HomePlate
        local focusPartFar
        local focusPartFov
        local enabled = false
        local originalCameraType -- To store the original camera type before switching

        local positionsAndFOVs = {
            [Vector3.new(0, 70, -320)] = 5,
            [Vector3.new(175, 10, -96.679)] = 60,
            [Vector3.new(-185, 40.852, -20.914)] = 7,
            [Vector3.new(-175, 10, 196.679)] = 3,
            [Vector3.new(170, 40, -20)] = 70,
        }

        local position = Vector3.new(0, 70, -320)

        local function handleKeyDown(key)
            if key == "3" then
                position = Vector3.new(0, 70, -320)
            elseif key == "4" then
                position = Vector3.new(-185, 40.852, -20.914)
            elseif key == "5" then
                position = Vector3.new(-175, 10, 196.679)
            elseif key == "6" then
                position = Vector3.new(170, 40, -20)
            elseif key == "x" then
                if enabled then
                    -- Switch back to the original camera
                    enabled = false
                    cam.CameraType = originalCameraType
                else
                    -- Enable custom camera
                    enabled = true
                    originalCameraType = cam.CameraType
                    cam.CameraType = Enum.CameraType.Custom
                end
            end
        end

        renderstep:Connect(function()
            if enabled then
                if FocusPart then
                    focusPartFar = (position - FocusPart.Position).Magnitude
                    focusPartFov = (10 - ((focusPartFar / 10) * 2)) + (FocusPart.Position.Y / 1.7)
                    if focusPartFov < 7 then
                        focusPartFov = 7
                    elseif focusPartFov > 15 then
                        focusPartFov = 15
                    end
                    cam.CameraType = Enum.CameraType.Scriptable
                    cam.CFrame = CFrame.new(position, FocusPart.Position)
                    cam.FieldOfView = positionsAndFOVs[position]
                end
            end
        end)

        game.Players.LocalPlayer:GetMouse().KeyDown:Connect(handleKeyDown)
    end
})

local Section = Tab:AddSection({
	Name = "Scorebug (CSV)"
})


Tab:AddButton({
	Name = "Export Outs",
	Callback = function()
local function waitUntilGameLoaded()
    repeat
        wait()
    until game:IsLoaded()
end

waitUntilGameLoaded()

local base = game.Players.LocalPlayer.PlayerGui.Scoreboard.ScoreHolder.Scoreboard

print("working")

-- Function to get the total number of outs
local function getTotalOuts()
    local out1 = base.Count.Outs[1].Visible
    local out2 = base.Count.Outs[2].Visible

    if out1 and out2 then
        return 2
    elseif out1 or out2 then
        return 1
    else
        return 0
    end
end

-- Function to update the outs in the CSV
function updateOutsInCSV()
    while true do
        local totalOuts = getTotalOuts()

        local csvContent = "Outs\n" ..
                           tostring(totalOuts)

        -- Write to a CSV file locally
        local success, errorMessage = pcall(function()
            writefile("Outs.csv", csvContent)
            print("Outs written to CSV")
        end)

        if not success then
            warn("Failed to write outs to CSV: " .. errorMessage)
        end

        wait(1) -- Adjust this interval based on your preference
    end
end

-- Call the function to start updating the CSV
updateOutsInCSV()


  	end    
})

Tab:AddButton({
	Name = "Export Bases",
	Callback = function()
-- Wait until the game is loaded
repeat
    wait()
until game:IsLoaded()

local base = game.Players.LocalPlayer.PlayerGui.Scoreboard.ScoreHolder.Scoreboard

print("working")

-- Function to get emoji based on visibility
local function getEmojiFromVisibility(visibility)
    return visibility and "C:\\Users\\luckd\\Downloads\\badses\\OnBase.png" or "C:\\Users\\luckd\\Downloads\\badses\\Not.png"
end

-- Function to update the bases in the CSV
function updateBasesInCSV()
    local first = base.BaseOuts.Base.B1.Visible
    local second = base.BaseOuts.Base.B2.Visible
    local third = base.BaseOuts.Base.B3.Visible

    local csvContent = "First,Second,Third\n"
        .. getEmojiFromVisibility(first) .. "," 
        .. getEmojiFromVisibility(second) .. "," 
        .. getEmojiFromVisibility(third)

    -- Write to a CSV file locally
    local success, errorMessage = pcall(function()
        writefile("Bases.csv", csvContent)
        print("Bases written to CSV")
    end)

    if not success then
        warn("Failed to write bases to CSV: " .. errorMessage)
    end
end

-- This function should be called regularly, for example, in your game update loop
function updateGame()
    while true do
        updateBasesInCSV()
        wait(1) -- Adjust this interval based on your preference
    end
end

updateGame() -- Call updateGame initially to start updating bases

  	end    
})


Tab:AddButton({
	Name = "Score/Stats",
	Callback = function()
   repeat wait() until game:IsLoaded()

local base1 = game:GetService("Workspace")
local fileName = "HCBB-BASEBALL.csv"

-- Add column names to the CSV file
repeat wait() until game:IsLoaded()

local base1 = game:GetService("Workspace")
local fileName = "HCBB-BASEBALL.csv"

-- Add column names to the CSV file
repeat wait() until game:IsLoaded()

local base1 = game:GetService("Workspace")
local fileName = "HCBB-BASEBALL.csv"

-- Add column names to the CSV file
writefile(fileName, "HomeScore,AwayScore,BatterHR,Batter,BatterRBI,BatterOPS,BatterAVG,Pitcher,PitcherBB,PitcherERA,PitcherWHIP,BatterHR2,Batter2,BatterRBI2,BatterOPS2,BatterAVG2\n")

while wait(1) do
    local homeScore = base1.ScoreBoard.Board.SG.F.Score.Home.Score.Text
    local awayScore = base1.ScoreBoard.Board.SG.F.Score.Away.Score.Text
    local BatterHR = base1.ScoreBoard.Board.SG.F.B.Stats.HR.Amount.Num.Text
    local BatterRBI = base1.ScoreBoard.Board.SG.F.B.Stats.RBI.Amount.Num.Text
    local BatterOPS = base1.ScoreBoard.Board.SG.F.B.Stats.OPS.Amount.Num.Text
    local BatterAVG = base1.ScoreBoard.Board.SG.F.B.Stats.BA.Amount.Num.Text
    local Batter = base1.ScoreBoard.Board.SG.F.B.PlayerInfo.Nam.Title.Text
    local Pitcher = base1.ScoreBoard.PBoard.PG.F.B.PlayerInfo.Nam.Title.Text
    local PitcherBB = base1.ScoreBoard.PBoard.PG.F.B.Stats1.BB.Amount.Num.Text
    local PitcherERA = base1.ScoreBoard.PBoard.PG.F.B.Stats1.ERA.Amount.Num.Text
    local PitcherWHIP = base1.ScoreBoard.PBoard.PG.F.B.Stats2.WHIP.Amount.Num.Text
    local BatterHR2 = base1.ScoreBoard.Board.SG.F.B2.Stats.HR.Amount.Num.Text
    local BatterRBI2 = base1.ScoreBoard.Board.SG.F.B2.Stats.RBI.Amount.Num.Text
    local BatterOPS2 = base1.ScoreBoard.Board.SG.F.B2.Stats.OPS.Amount.Num.Text
    local BatterAVG2 = base1.ScoreBoard.Board.SG.F.B2.Stats.BA.Amount.Num.Text
    local Batter2 = base1.ScoreBoard.Board.SG.F.B2.PlayerInfo.Nam.Title.Text
    
    -- Remove "." from RBI section
    BatterRBI = BatterRBI:gsub("%.", "")
    BatterRBI2 = BatterRBI2:gsub("%.", "")

    local data = string.format("HomeScore,AwayScore,BatterHR,Batter,BatterRBI,BatterOPS,BatterAVG,Pitcher,PitcherBB,PitcherERA,PitcherWHIP,BatterHR2,Batter2,BatterRBI2,BatterOPS2,BatterAVG2\n%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s\n", homeScore, awayScore, BatterHR, Batter, BatterOPS, BatterRBI, BatterAVG, Pitcher, PitcherBB, PitcherERA, PitcherWHIP, BatterHR2, Batter2, BatterRBI2, BatterOPS2, BatterAVG2)
    writefile(fileName, data, "a")  -- Use "a" to append to the file instead of overwriting
    print("Stats written to CSV")

    game.Players.LocalPlayer.PlayerGui.Scoreboard.Enabled = false
    game.Players.LocalPlayer.PlayerGui.SettingsGui.Enabled = false
    game.Players.LocalPlayer.PlayerGui.PlayerInfo.Enabled = false
end

updateGame() -- Call updateGame initially to start updating counts
  	end    
})


Tab:AddButton({
	Name = "HCBB Count",
	Callback = function()
  repeat wait() until game:IsLoaded()
local base = game.Players.LocalPlayer.PlayerGui.Scoreboard.ScoreHolder.Scoreboard

print("working")

-- Function to update the counts based on visibility
function updateCountsBasedOnVisibility()
    local ballCount = 0
    local strikeCount = 0

    -- Update ball count based on visibility
    for i = 1, 3 do
        if base.Count.Balls[i].Visible then
            ballCount = ballCount + 1
        end
    end

    -- Update strike count based on visibility
    for i = 1, 2 do
        if base.Count.Strikes[i].Visible then
            strikeCount = strikeCount + 1
        end
    end

    local csvContent = "Count\n" .. ballCount .. "-" .. strikeCount

    -- Write to a CSV file locally
    local success, errorMessage = pcall(function()
        writefile("Counts.csv", csvContent)
        print("Counts written to CSV")
    end)

    if not success then
        warn("Failed to write counts to CSV: " .. errorMessage)
    end
end

-- This function should be called regularly, for example, in your game update loop
function updateGame()
    while true do
        updateCountsBasedOnVisibility()
        wait(1) -- Adjust this interval based on your preference
    end
end

updateGame() -- Call updateGame initially to start updating counts
  	end    
})


local Section = Tab:AddSection({
	Name = "Scorebug (TXT)"
})

Tab:AddButton({
	Name = "Stats/Score",
	Callback = function()
        repeat wait() until game:IsLoaded()

        local base1 = game:GetService("Workspace")
        
        -- Create file names for each column
        local fileNames = {
            "HomeScore.txt",
            "AwayScore.txt",
            "BatterHR.txt",
            "Batter.txt",
            "BatterRBI.txt",
            "BatterOPS.txt",
            "BatterAVG.txt",
            "Pitcher.txt",
            "PitcherBB.txt",
            "PitcherERA.txt",
            "PitcherWHIP.txt",
            "BatterHR2.txt",
            "Batter2.txt",
            "BatterRBI2.txt",
            "BatterOPS2.txt",
            "BatterAVG2.txt"
        }
        
        while wait(1) do
            local homeScore = base1.ScoreBoard.Board.SG.F.Score.Home.Score.Text
            local awayScore = base1.ScoreBoard.Board.SG.F.Score.Away.Score.Text
            local BatterHR = base1.ScoreBoard.Board.SG.F.B.Stats.HR.Amount.Num.Text
            local BatterRBI = base1.ScoreBoard.Board.SG.F.B.Stats.RBI.Amount.Num.Text
            local BatterOPS = base1.ScoreBoard.Board.SG.F.B.Stats.OPS.Amount.Num.Text
            local BatterAVG = base1.ScoreBoard.Board.SG.F.B.Stats.BA.Amount.Num.Text
            local Batter = base1.ScoreBoard.Board.SG.F.B.PlayerInfo.Nam.Title.Text
            local Pitcher = base1.ScoreBoard.PBoard.PG.F.B.PlayerInfo.Nam.Title.Text
            local PitcherBB = base1.ScoreBoard.PBoard.PG.F.B.Stats1.BB.Amount.Num.Text
            local PitcherERA = base1.ScoreBoard.PBoard.PG.F.B.Stats1.ERA.Amount.Num.Text
            local PitcherWHIP = base1.ScoreBoard.PBoard.PG.F.B.Stats2.WHIP.Amount.Num.Text
            local BatterHR2 = base1.ScoreBoard.Board.SG.F.B2.Stats.HR.Amount.Num.Text
            local BatterRBI2 = base1.ScoreBoard.Board.SG.F.B2.Stats.RBI.Amount.Num.Text
            local BatterOPS2 = base1.ScoreBoard.Board.SG.F.B2.Stats.OPS.Amount.Num.Text
            local BatterAVG2 = base1.ScoreBoard.Board.SG.F.B2.Stats.BA.Amount.Num.Text
            local Batter2 = base1.ScoreBoard.Board.SG.F.B2.PlayerInfo.Nam.Title.Text
            
            -- Remove "." from RBI section
            BatterRBI = BatterRBI:gsub("%.", "")
            BatterRBI2 = BatterRBI2:gsub("%.", "")
        
            -- Write data to corresponding files
            for i, fileName in ipairs(fileNames) do
                local data
                if i == 1 then
                    data = homeScore
                elseif i == 2 then
                    data = awayScore
                elseif i == 3 then
                    data = BatterHR
                elseif i == 4 then
                    data = Batter
                elseif i == 5 then
                    data = BatterRBI
                elseif i == 6 then
                    data = BatterOPS
                elseif i == 7 then
                    data = BatterAVG
                elseif i == 8 then
                    data = Pitcher
                elseif i == 9 then
                    data = PitcherBB
                elseif i == 10 then
                    data = PitcherERA
                elseif i == 11 then
                    data = PitcherWHIP
                elseif i == 12 then
                    data = BatterHR2
                elseif i == 13 then
                    data = Batter2
                elseif i == 14 then
                    data = BatterRBI2
                elseif i == 15 then
                    data = BatterOPS2
                elseif i == 16 then
                    data = BatterAVG2
                end
                writefile(fileName, data, "w")  -- Use "w" to overwrite the file
            end
            
            print("Stats written to TXT files")
        
            game.Players.LocalPlayer.PlayerGui.Scoreboard.Enabled = false
            game.Players.LocalPlayer.PlayerGui.SettingsGui.Enabled = false
            game.Players.LocalPlayer.PlayerGui.PlayerInfo.Enabled = false
        end
  	end    
})


Tab:AddButton({
	Name = "Counts",
	Callback = function()
        local base = game.Players.LocalPlayer.PlayerGui.Scoreboard.ScoreHolder.Scoreboard

        local homePitchCounter = 0 -- Initialize home pitch counter
        local awayPitchCounter = 0 -- Initialize away pitch counter
        local previousBallCount = 0 -- Initialize previous ball count
        local previousStrikeCount = 0 -- Initialize previous strike count
        local isHomePitch = true -- Variable to track whether it's home pitch or away pitch
        
        -- Function to update the counts based on visibility
        local function updateCountsBasedOnVisibility(ballCount, strikeCount)
            -- Update pitch counter only when the ball or strike count changes
            if ballCount ~= previousBallCount or strikeCount ~= previousStrikeCount then
                if isHomePitch then
                    homePitchCounter = homePitchCounter + 1
                    print("Home pitch count updated to " .. homePitchCounter) -- Debug statement
                else
                    awayPitchCounter = awayPitchCounter + 1
                    print("Away pitch count updated to " .. awayPitchCounter) -- Debug statement
                end
        
                -- Update previous counts
                previousBallCount = ballCount
                previousStrikeCount = strikeCount
        
                -- Write data to corresponding files
                local pitchCount = isHomePitch and homePitchCounter or awayPitchCounter
                writefile("BallCount.txt", tostring(ballCount), "w")
                writefile("StrikeCount.txt", tostring(strikeCount), "w")
                writefile("PitchCount.txt", tostring(pitchCount), "w")
                
                print("Counts written to TXT files")
            end
        end
        
        -- Function to handle key presses
        local function onKeyDown(input)
            if input.KeyCode == Enum.KeyCode.P then
                print("P key pressed") -- Debug statement
                if isHomePitch then
                    homePitchCounter = 0 -- Reset home pitch counter
                    print("Home pitch counter reset to 1") -- Debug statement
                else
                    awayPitchCounter = 0 -- Reset away pitch counter
                    print("Away pitch counter reset to 1") -- Debug statement
                end
            elseif input.KeyCode == Enum.KeyCode.Equals then
                print("Equals key pressed") -- Debug statement
                if isHomePitch then
                    homePitchCounter = homePitchCounter + 1 -- Increment home pitch counter
                    print("Home pitch count incremented to " .. homePitchCounter) -- Debug statement
                else
                    awayPitchCounter = awayPitchCounter + 1 -- Increment away pitch counter
                    print("Away pitch count incremented to " .. awayPitchCounter) -- Debug statement
                end
            elseif input.KeyCode == Enum.KeyCode.L then
                print("L key pressed") -- Debug statement
                isHomePitch = not isHomePitch -- Toggle between home and away pitch counts
                if isHomePitch then
                    print("Switched to Home pitch count") -- Debug statement
                else
                    print("Switched to Away pitch count") -- Debug statement
                end
            end
        
            updateCountsBasedOnVisibility(previousBallCount, previousStrikeCount) -- Update counts instantly
        end
        
        -- Connect the key down event
        game:GetService("UserInputService").InputBegan:Connect(onKeyDown)
        
        -- This function should be called regularly, for example, in your game update loop
        local function updateGame()
            local ballCount = 0
            local strikeCount = 0
        
            -- Update ball count based on visibility
            for i = 1, 3 do
                if base.Count.Balls[i].Visible then
                    ballCount = ballCount + 1
                end
            end
        
            -- Update strike count based on visibility
            for i = 1, 2 do
                if base.Count.Strikes[i].Visible then
                    strikeCount = strikeCount + 1
                end
            end
        
            updateCountsBasedOnVisibility(ballCount, strikeCount)
        end
        
        while true do
            updateGame()
            wait(1) -- Adjust this interval based on your preference
        end
        
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Tab:AddButton({
	Name = "Outs",
	Callback = function()
        local function waitUntilGameLoaded()
            repeat
                wait()
            until game:IsLoaded()
        end
        
        waitUntilGameLoaded()
        
        local base = game.Players.LocalPlayer.PlayerGui.Scoreboard.ScoreHolder.Scoreboard
        
        print("working")
        
        -- Function to get the total number of outs
        local function getTotalOuts()
            local out1 = base.Count.Outs[1].Visible
            local out2 = base.Count.Outs[2].Visible
        
            if out1 and out2 then
                return 2
            elseif out1 or out2 then
                return 1
            else
                return 0
            end
        end
        
        -- Function to update the outs in the TXT files
        function updateOutsInTXT()
            while true do
                local totalOuts = getTotalOuts()
        
                -- Write data to corresponding files
                writefile("Outs.txt", tostring(totalOuts), "w")
        
                print("Outs written to TXT file")
        
                wait(1) -- Adjust this interval based on your preference
            end
        end
        
        -- Call the function to start updating the TXT files
        updateOutsInTXT()
        
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Tab = Window:MakeTab({
    Name = "Basketball Legends",
    Icon = "rbxassetid://",
    PremiumOnly = false
})
local Section = Tab:AddSection({
    Name = "Scorebug Things"
})
Tab:AddButton({
	Name = "Scorebug Reader (CSV)",
	Callback = function()
        repeat wait() until game:IsLoaded()

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Player = game:GetService("Players").LocalPlayer
        
        local SharedUtil = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("SharedUtil"))
        local IsLeague = SharedUtil.GSettings.Game == "League"
        
        local PlayerGui = Player:WaitForChild("PlayerGui")
        local base1 = nil 
        
        if IsLeague then
            base1 = PlayerGui:WaitForChild("ScoreboardUI"):WaitForChild("Scoreboard")
        else 
            base1 = PlayerGui:WaitForChild("Main"):WaitForChild("Scoreboard")
        end
        if not base1 then
            warn("Scoreboard frame not found.")
            return
        end
        local fileName = "LFG-BASKETBALL.csv"
        
        -- Add column names to the CSV file
        writefile(fileName, "HomeScore,AwayScore,Quarter,ShotClock,Clock\n")
        
        while wait(1) do
            local homeScore = base1.Home.Score.Text
            local awayScore = base1.Away.Score.Text
            local Quarter = base1.Info.Quarter.Text
            local ShotClock = base1.Info.ShotClock.Text
            local Clock = base1.Info.Clock.Text
        
            local data = string.format("HomeScore,AwayScore,Quarter,ShotClock,Clock\n%s,%s,%s,%s,%s\n", homeScore, awayScore, Quarter, ShotClock, Clock)
            writefile(fileName, data, "a")  -- Use "a" to append to the file instead of overwriting
            print("Stats written to CSV")
        
            base1.Visible = false
        end
  	end    
})

Tab:AddButton({
	Name = "Scorebug Reader (TXT)",
	Callback = function()
        repeat wait() until game:IsLoaded()

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Player = game:GetService("Players").LocalPlayer
        
        local SharedUtil = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("SharedUtil"))
        local IsLeague = SharedUtil.GSettings.Game == "League"
        
        local PlayerGui = Player:WaitForChild("PlayerGui")
        local base1 = nil 
        
        if IsLeague then
            base1 = PlayerGui:WaitForChild("ScoreboardUI"):WaitForChild("Scoreboard")
        else 
            base1 = PlayerGui:WaitForChild("Main"):WaitForChild("Scoreboard")
        end
        
        if not base1 then
            warn("Scoreboard frame not found.")
            return
        end
        
        -- Define file names for each column
        local fileNames = {
            "HomeScore.txt",
            "AwayScore.txt",
            "Quarter.txt",
            "ShotClock.txt",
            "Clock.txt"
        }
        
        -- Function to write data to TXT files
        local function writeDataToTXT()
            while wait(1) do
                local homeScore = base1.Home.Score.Text
                local awayScore = base1.Away.Score.Text
                local Quarter = base1.Info.Quarter.Text
                local ShotClock = base1.Info.ShotClock.Text
                local Clock = base1.Info.Clock.Text
        
                -- Write data to corresponding files
                for i, fileName in ipairs(fileNames) do
                    local data
                    if i == 1 then
                        data = homeScore
                    elseif i == 2 then
                        data = awayScore
                    elseif i == 3 then
                        data = Quarter
                    elseif i == 4 then
                        data = ShotClock
                    elseif i == 5 then
                        data = Clock
                    end
                    writefile(fileName, data, "w")  -- Use "w" to overwrite the file
                end
        
                print("Stats written to TXT files")
            end
        end
        
        -- Call the function to start updating the TXT files
        writeDataToTXT()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
    Name = "Stadiums"
})

Tab:AddButton({
	Name = "RSPN Arena",
	Callback = function()
      		-- Replace these values with your actual asset ID
local selectedAssetId = "17260052040"

-- Function to replace model named "Arena" with the selected asset ID
local function replaceArenaWithAsset()
    local game = game
    local workspace = game:GetService("Workspace")

    -- Iterate through each descendant of Workspace
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("Model") and descendant.Name == "Arena" then
            -- Remove existing Stadium model
            descendant:Destroy()

            -- Create new model using the selected asset ID
            local assetModel = game:GetObjects("rbxassetid://" .. selectedAssetId)[1]
            if assetModel then
                assetModel.Parent = workspace
                print("Arenamodel replaced with asset ID:", selectedAssetId)
            else
                warn("Failed to load asset with ID:", selectedAssetId)
            end
        end
    end
end

-- Call the function to replace Stadium with the selected asset
replaceArenaWithAsset()
  	end    
})


Tab:AddButton({
	Name = "RSPN Court",
	Callback = function()
      		-- Replace these values with your actual asset ID
local selectedAssetId = "17260078373"

-- Function to replace model named "Court" with the selected asset ID
local function replaceCourtWithAsset()
    local game = game
    local workspace = game:GetService("Workspace")

    -- Iterate through each descendant of Workspace
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("Model") and descendant.Name == "Court" then
            -- Remove existing Stadium model
            descendant:Destroy()

            -- Create new model using the selected asset ID
            local assetModel = game:GetObjects("rbxassetid://" .. selectedAssetId)[1]
            if assetModel then
                assetModel.Parent = workspace
                print("Arenamodel replaced with asset ID:", selectedAssetId)
            else
                warn("Failed to load asset with ID:", selectedAssetId)
            end
        end
    end
end

-- Call the function to replace Stadium with the selected asset
replaceCourtWithAsset()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
    Name = "Extra"
})

Tab:AddButton({
	Name = "UI Remover",
	Callback = function()
        for i, v in pairs(game.Players.LocalPlayer.PlayerGui:GetChildren()) do
            if v:IsA("ScreenGui") then
              v.Enabled = false
            end
          end
  	end    
})


local Tab = Window:MakeTab({
    Name = "NASCAR",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "NASCAR trackers"
})
Tab:AddButton({
    Name = "Nascar Standings",
    Callback = function()
-- Function to collect data from TextBoxes and order by "pos"
local function collectAndOrderData()
    local frames = game.Players.LocalPlayer.PlayerGui.Standings_Gui.Standings:GetChildren()
    local standingsData = {}

    for _, frame in ipairs(frames) do
        if frame.Name ~= "template" and frame:IsA("Frame") then
            local posText = frame:WaitForChild("Pos").Text
            local pos = tonumber(posText)

            -- Check if pos is a valid number
            if pos then
                local username = frame:WaitForChild("Driver").Text
                local gap = frame:WaitForChild("Gap").Text

                table.insert(standingsData, {pos = pos, username = username, gap = gap})
            else
                warn("Invalid 'pos' value for frame:", frame)
            end
        end
    end

    -- Order data based on "pos"
    table.sort(standingsData, function(a, b) return (a.pos or 0) < (b.pos or 0) end)

    return standingsData
end

-- Function to write data to CSV file using writefile
local function writeDataToCSV(data)
    local csvContent = "pos,username,gap\n"

    for _, entry in ipairs(data) do
        csvContent = csvContent .. entry.pos .. "," .. entry.username .. "," .. entry.gap .. "\n"
    end

    local success, errorMessage = pcall(function()
        writefile("standings.csv", csvContent)
        print("CSV file updated.")
    end)

    if not success then
        warn("Failed to write CSV file:", errorMessage)
    end
end

-- Function to update standings data and write to CSV every 4 seconds
local function updateStandings()
    while true do
        local standingsData = collectAndOrderData()
        writeDataToCSV(standingsData)
        wait(4)  -- Wait for 4 seconds before the next update
    end
end

-- Start the auto-update loop
spawn(updateStandings)

end
})
Tab:AddButton({
	Name = "Laps and Flag Color",
	Callback = function()
        repeat wait() until game:IsLoaded()

        local player = game.Players.LocalPlayer
        local base = player.PlayerGui.Standings_Gui.Lap
        
        -- Function to convert RGB to HEX
        local function rgbToHex(r, g, b)
            r, g, b = math.floor(r * 255), math.floor(g * 255), math.floor(b * 255)
        
            local function toHex(c)
                local hex = string.format("%X", c)
                return #hex == 1 and "0" .. hex or hex
            end
        
            return "#" .. toHex(r) .. toHex(g) .. toHex(b)
        end
        
        -- Function to write data to CSV file
        local function writeDataToCSV(lap, rgbColor)
            local hexColor = rgbToHex(rgbColor.r, rgbColor.g, rgbColor.b)
            local csvContent = "Lap,FlagColor\n" .. lap .. "," .. hexColor .. "\n"
        
            local success, errorMessage = pcall(function()
                writefile("lap_data.csv", csvContent)
                print("CSV file updated.")
            end)
        
            if not success then
                warn("Failed to write CSV file:", errorMessage)
            end
        end
        
        while wait(1) do
            local lap = base.Value.Text
            local back = base.Flag.BackgroundColor3
        
            -- Write lap and flag color data to CSV
            writeDataToCSV(lap, back)
        
            print("Lap:", lap)
            print("Flag Color (RGB):", back.r, back.g, back.b)
            print("Flag Color (HEX):", rgbToHex(back.r, back.g, back.b))
        
            game.Players.LocalPlayer.PlayerGui.Standings_Gui.Standings.Visible = false
        game.Players.LocalPlayer.PlayerGui.Standings_Gui.Control.Visible = false
        game.Players.LocalPlayer.PlayerGui.Standings_Gui.Lap.Visible = false
        end
  	end    
})

local Tab = Window:MakeTab({
    Name = "Hockey Legends",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Scoreboards"
})

Tab:AddButton({
	Name = "Scorebug Reader (CSV)",
	Callback = function()
        repeat wait() until game:IsLoaded()

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Player = game:GetService("Players").LocalPlayer
        
        local SharedUtil = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("SharedUtil"))
        local IsLeague = SharedUtil.GSettings.Game == "League"
        
        local PlayerGui = Player:WaitForChild("PlayerGui")
        local base1 = nil 
        
        if IsLeague then
            base1 = PlayerGui:WaitForChild("ScoreboardUI"):WaitForChild("Scoreboard")
        else 
            base1 = PlayerGui:WaitForChild("Main"):WaitForChild("Scoreboard")
        end
        
        if not base1 then
            warn("Scoreboard frame not found.")
            return
        end
        
        -- Disable all ScreenGui elements in the player's PlayerGui
        for i, v in pairs(PlayerGui:GetChildren()) do
            if v:IsA("ScreenGui") then
                v.Enabled = false
            end
        end
        
        while wait(1) do
            local homeScore = base1.Score.HomeScore.Text
            local awayScore = base1.Score.AwayScore.Text
            local timer = base1.Timer.Text
        
            local data = string.format("HomeScore: %s, AwayScore: %s, Timer: %s", homeScore, awayScore, timer)
            print("Stats: " .. data)
        
            base1.Visible = false
        end
  	end    
})

Tab:AddButton({
	Name = "Scorebug Reader (TXT)",
	Callback = function()
        repeat wait() until game:IsLoaded()

        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Player = game:GetService("Players").LocalPlayer
        
        local SharedUtil = require(ReplicatedStorage:WaitForChild("Modules"):WaitForChild("SharedUtil"))
        local IsLeague = SharedUtil.GSettings.Game == "League"
        
        local PlayerGui = Player:WaitForChild("PlayerGui")
        local base1 = nil 
        
        if IsLeague then
            base1 = PlayerGui:WaitForChild("ScoreboardUI"):WaitForChild("Scoreboard")
        else 
            base1 = PlayerGui:WaitForChild("Main"):WaitForChild("Scoreboard")
        end
        
        if not base1 then
            warn("Scoreboard frame not found.")
            return
        end
        
        -- Disable all ScreenGui elements in the player's PlayerGui
        for i, v in pairs(PlayerGui:GetChildren()) do
            if v:IsA("ScreenGui") then
                v.Enabled = false
            end
        end
        
        -- Define file names for each column
        local fileNames = {
            "HomeScore.txt",
            "AwayScore.txt",
            "Timer.txt"
        }
        
        -- Function to write data to TXT files
        local function writeDataToTXT()
            while wait(1) do
                local homeScore = base1.Score.HomeScore.Text
                local awayScore = base1.Score.AwayScore.Text
                local timer = base1.Timer.Text
        
                -- Write data to corresponding files
                for i, fileName in ipairs(fileNames) do
                    local data
                    if i == 1 then
                        data = homeScore
                    elseif i == 2 then
                        data = awayScore
                    elseif i == 3 then
                        data = timer
                    end
                    writefile(fileName, data, "w")  -- Use "w" to overwrite the file
                end
        
                print("Stats written to TXT files")
            end
        end
        
        -- Call the function to start updating the TXT files
        writeDataToTXT()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Section = Tab:AddSection({
    Name = "Stadiums"
})

Tab:AddButton({
	Name = "RSPN Arena",
	Callback = function()
      		-- Replace these values with your actual asset ID
local selectedAssetId = "17372979909"

-- Function to replace model named "Arena" with the selected asset ID
local function replaceArenaWithAsset()
    local game = game
    local workspace = game:GetService("Workspace")

    -- Iterate through each descendant of Workspace
    for _, descendant in ipairs(workspace:GetDescendants()) do
        if descendant:IsA("Model") and descendant.Name == "Arena" then
            -- Remove existing Stadium model
            descendant:Destroy()

            -- Create new model using the selected asset ID
            local assetModel = game:GetObjects("rbxassetid://" .. selectedAssetId)[1]
            if assetModel then
                assetModel.Parent = workspace
                print("Arenamodel replaced with asset ID:", selectedAssetId)
            else
                warn("Failed to load asset with ID:", selectedAssetId)
            end
        end
    end
end

-- Call the function to replace Stadium with the selected asset
replaceArenaWithAsset()
  	end    
})

Tab:AddButton({
	Name = "RSPN Logos (On the ice)",
	Callback = function()
game:GetObjects("rbxassetid://17373219745")[1].Parent = Workspace
 end
})

local Tab = Window:MakeTab({
    Name = "Settings",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

Tab:AddButton({
    Name = "Free Cam (Shift p)",
    Callback = function()
function sandbox(var,func)
    local env = getfenv(func)
    local newenv = setmetatable({},{
    __index = function(self,k)
    if k=="script" then
    return var
    else
    return env[k]
    end
    end,
    })
    setfenv(func,newenv)
    return func
    end
    cors = {}
    mas = Instance.new("Model",game:GetService("Lighting"))
    LocalScript0 = Instance.new("LocalScript")
    LocalScript0.Name = "FreeCamera"
    LocalScript0.Parent = mas
    table.insert(cors,sandbox(LocalScript0,function()
    
    local pi    = math.pi
    local abs   = math.abs
    local clamp = math.clamp
    local exp   = math.exp
    local rad   = math.rad
    local sign  = math.sign
    local sqrt  = math.sqrt
    local tan   = math.tan
    
    local ContextActionService = game:GetService("ContextActionService")
    local Players = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local StarterGui = game:GetService("StarterGui")
    local UserInputService = game:GetService("UserInputService")
    
    local LocalPlayer = Players.LocalPlayer
    if not LocalPlayer then
    Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
    LocalPlayer = Players.LocalPlayer
    end
    
    local Camera = workspace.CurrentCamera
    workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
    local newCamera = workspace.CurrentCamera
    if newCamera then
    Camera = newCamera
    end
    end)
    
    ------------------------------------------------------------------------
    
    local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
    local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
    local FREECAM_MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}
    
    local NAV_GAIN = Vector3.new(1, 1, 1)*64
    local PAN_GAIN = Vector2.new(0.75, 1)*8
    local FOV_GAIN = 300
    
    local PITCH_LIMIT = rad(90)
    
    local VEL_STIFFNESS = 1.5
    local PAN_STIFFNESS = 1.0
    local FOV_STIFFNESS = 4.0
    
    ------------------------------------------------------------------------
    
    local Spring = {} do
    Spring.__index = Spring
    
    function Spring.new(freq, pos)
    local self = setmetatable({}, Spring)
    self.f = freq
    self.p = pos
    self.v = pos*0
    return self
    end
    
    function Spring:Update(dt, goal)
    local f = self.f*2*pi
    local p0 = self.p
    local v0 = self.v
    
    local offset = goal - p0
    local decay = exp(-f*dt)
    
    local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
    local v1 = (f*dt*(offset*f - v0) + v0)*decay
    
    self.p = p1
    self.v = v1
    
    return p1
    end
    
    function Spring:Reset(pos)
    self.p = pos
    self.v = pos*0
    end
    end
    
    ------------------------------------------------------------------------
    
    local cameraPos = Vector3.new()
    local cameraRot = Vector2.new()
    local cameraFov = 0
    
    local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
    local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
    local fovSpring = Spring.new(FOV_STIFFNESS, 0)
    
    ------------------------------------------------------------------------
    
    local Input = {} do
    local thumbstickCurve do
    local K_CURVATURE = 2.0
    local K_DEADZONE = 0.15
    
    local function fCurve(x)
    return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
    end
    
    local function fDeadzone(x)
    return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
    end
    
    function thumbstickCurve(x)
    return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
    end
    end
    
    local gamepad = {
    ButtonX = 0,
    ButtonY = 0,
    DPadDown = 0,
    DPadUp = 0,
    ButtonL2 = 0,
    ButtonR2 = 0,
    Thumbstick1 = Vector2.new(),
    Thumbstick2 = Vector2.new(),
    }
    
    local keyboard = {
    W = 0,
    A = 0,
    S = 0,
    D = 0,
    E = 0,
    Q = 0,
    U = 0,
    H = 0,
    J = 0,
    K = 0,
    I = 0,
    Y = 0,
    Up = 0,
    Down = 0,
    LeftShift = 0,
    RightShift = 0,
    }
    
    local mouse = {
    Delta = Vector2.new(),
    MouseWheel = 0,
    }
    
    local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
    local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
    local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
    local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
    local FOV_WHEEL_SPEED    = 1.0
    local FOV_GAMEPAD_SPEED  = 0.25
    local NAV_ADJ_SPEED      = 0.75
    local NAV_SHIFT_MUL      = 0.25
    
    local navSpeed = 1
    
    function Input.Vel(dt)
    navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)
    
    local kGamepad = Vector3.new(
    thumbstickCurve(gamepad.Thumbstick1.x),
    thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
    thumbstickCurve(-gamepad.Thumbstick1.y)
    )*NAV_GAMEPAD_SPEED
    
    local kKeyboard = Vector3.new(
    keyboard.D - keyboard.A + keyboard.K - keyboard.H,
    keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
    keyboard.S - keyboard.W + keyboard.J - keyboard.U
    )*NAV_KEYBOARD_SPEED
    
    local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
    
    return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
    end
    
    function Input.Pan(dt)
    local kGamepad = Vector2.new(
    thumbstickCurve(gamepad.Thumbstick2.y),
    thumbstickCurve(-gamepad.Thumbstick2.x)
    )*PAN_GAMEPAD_SPEED
    local kMouse = mouse.Delta*PAN_MOUSE_SPEED
    mouse.Delta = Vector2.new()
    return kGamepad + kMouse
    end
    
    function Input.Fov(dt)
    local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
    local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
    mouse.MouseWheel = 0
    return kGamepad + kMouse
    end
    
    do
    local function Keypress(action, state, input)
    keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
    return Enum.ContextActionResult.Sink
    end
    
    local function GpButton(action, state, input)
    gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
    return Enum.ContextActionResult.Sink
    end
    
    local function MousePan(action, state, input)
    local delta = input.Delta
    mouse.Delta = Vector2.new(-delta.y, -delta.x)
    return Enum.ContextActionResult.Sink
    end
    
    local function Thumb(action, state, input)
    gamepad[input.KeyCode.Name] = input.Position
    return Enum.ContextActionResult.Sink
    end
    
    local function Trigger(action, state, input)
    gamepad[input.KeyCode.Name] = input.Position.z
    return Enum.ContextActionResult.Sink
    end
    
    local function MouseWheel(action, state, input)
    mouse[input.UserInputType.Name] = -input.Position.z
    return Enum.ContextActionResult.Sink
    end
    
    local function Zero(t)
    for k, v in pairs(t) do
    t[k] = v*0
    end
    end
    
    function Input.StartCapture()
    ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
    Enum.KeyCode.W, Enum.KeyCode.U,
    Enum.KeyCode.A, Enum.KeyCode.H,
    Enum.KeyCode.S, Enum.KeyCode.J,
    Enum.KeyCode.D, Enum.KeyCode.K,
    Enum.KeyCode.E, Enum.KeyCode.I,
    Enum.KeyCode.Q, Enum.KeyCode.Y,
    Enum.KeyCode.Up, Enum.KeyCode.Down
    )
    ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
    ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
    ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
    ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
    ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
    end
    
    function Input.StopCapture()
    navSpeed = 1
    Zero(gamepad)
    Zero(keyboard)
    Zero(mouse)
    ContextActionService:UnbindAction("FreecamKeyboard")
    ContextActionService:UnbindAction("FreecamMousePan")
    ContextActionService:UnbindAction("FreecamMouseWheel")
    ContextActionService:UnbindAction("FreecamGamepadButton")
    ContextActionService:UnbindAction("FreecamGamepadTrigger")
    ContextActionService:UnbindAction("FreecamGamepadThumbstick")
    end
    end
    end
    
    local function GetFocusDistance(cameraFrame)
    local znear = 0.1
    local viewport = Camera.ViewportSize
    local projy = 2*tan(cameraFov/2)
    local projx = viewport.x/viewport.y*projy
    local fx = cameraFrame.rightVector
    local fy = cameraFrame.upVector
    local fz = cameraFrame.lookVector
    
    local minVect = Vector3.new()
    local minDist = 512
    
    for x = 0, 1, 0.5 do
    for y = 0, 1, 0.5 do
    local cx = (x - 0.5)*projx
    local cy = (y - 0.5)*projy
    local offset = fx*cx - fy*cy + fz
    local origin = cameraFrame.p + offset*znear
    local part, hit = workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
    local dist = (hit - origin).magnitude
    if minDist > dist then
    minDist = dist
    minVect = offset.unit
    end
    end
    end
    
    return fz:Dot(minVect)*minDist
    end
    
    ------------------------------------------------------------------------
    
    local function StepFreecam(dt)
    local vel = velSpring:Update(dt, Input.Vel(dt))
    local pan = panSpring:Update(dt, Input.Pan(dt))
    local fov = fovSpring:Update(dt, Input.Fov(dt))
    
    local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))
    
    cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
    cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
    cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))
    
    local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
    cameraPos = cameraCFrame.p
    
    Camera.CFrame = cameraCFrame
    Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
    Camera.FieldOfView = cameraFov
    end
    
    ------------------------------------------------------------------------
    
    local PlayerState = {} do
    local mouseIconEnabled
    local cameraSubject
    local cameraType
    local cameraFocus
    local cameraCFrame
    local cameraFieldOfView
    local screenGuis = {}
    local coreGuis = {
    Backpack = true,
    Chat = true,
    Health = true,
    PlayerList = true,
    }
    local setCores = {
    BadgesNotificationsActive = true,
    PointsNotificationsActive = true,
    }
    
    -- Save state and set up for freecam
    function PlayerState.Push()
    for name in pairs(coreGuis) do
    coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
    end
    for name in pairs(setCores) do
    setCores[name] = StarterGui:GetCore(name)
    StarterGui:SetCore(name, false)
    end
    local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
    if playergui then
    for _, gui in pairs(playergui:GetChildren()) do
    if gui:IsA("ScreenGui") and gui.Enabled then
    screenGuis[#screenGuis + 1] = gui
    gui.Enabled = false
    end
    end
    end
    
    cameraFieldOfView = Camera.FieldOfView
    Camera.FieldOfView = 70
    
    cameraType = Camera.CameraType
    Camera.CameraType = Enum.CameraType.Custom
    
    cameraSubject = Camera.CameraSubject
    Camera.CameraSubject = nil
    
    cameraCFrame = Camera.CFrame
    cameraFocus = Camera.Focus
    
    mouseIconEnabled = UserInputService.MouseIconEnabled
    UserInputService.MouseIconEnabled = false
    
    mouseBehavior = UserInputService.MouseBehavior
    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
    end
    
    -- Restore state
    function PlayerState.Pop()
    for name, isEnabled in pairs(coreGuis) do
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
    end
    for name, isEnabled in pairs(setCores) do
    StarterGui:SetCore(name, isEnabled)
    end
    for _, gui in pairs(screenGuis) do
    if gui.Parent then
    gui.Enabled = true
    end
    end
    
    Camera.FieldOfView = cameraFieldOfView
    cameraFieldOfView = nil
    
    Camera.CameraType = cameraType
    cameraType = nil
    
    Camera.CameraSubject = cameraSubject
    cameraSubject = nil
    
    Camera.CFrame = cameraCFrame
    cameraCFrame = nil
    
    Camera.Focus = cameraFocus
    cameraFocus = nil
    
    UserInputService.MouseIconEnabled = mouseIconEnabled
    mouseIconEnabled = nil
    
    UserInputService.MouseBehavior = mouseBehavior
    mouseBehavior = nil
    end
    end
    
    local function StartFreecam()
    local cameraCFrame = Camera.CFrame
    cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
    cameraPos = cameraCFrame.p
    cameraFov = Camera.FieldOfView
    
    velSpring:Reset(Vector3.new())
    panSpring:Reset(Vector2.new())
    fovSpring:Reset(0)
    
    PlayerState.Push()
    RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
    Input.StartCapture()
    end
    
    local function StopFreecam()
    Input.StopCapture()
    RunService:UnbindFromRenderStep("Freecam")
    PlayerState.Pop()
    end
    
    ------------------------------------------------------------------------
    
    do
    local enabled = false
    
    local function ToggleFreecam()
    if enabled then
    StopFreecam()
    else
    StartFreecam()
    end
    enabled = not enabled
    end
    
    local function CheckMacro(macro)
    for i = 1, #macro - 1 do
    if not UserInputService:IsKeyDown(macro[i]) then
    return
    end
    end
    ToggleFreecam()
    end
    
    local function HandleActivationInput(action, state, input)
    if state == Enum.UserInputState.Begin then
    if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
    CheckMacro(FREECAM_MACRO_KB)
    end
    end
    return Enum.ContextActionResult.Pass
    end
    
    ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])
    end
    end))
    for i,v in pairs(mas:GetChildren()) do
    v.Parent = game:GetService("Players").LocalPlayer.PlayerGui
    pcall(function() v:MakeJoints() end)
    end
    mas:Destroy()
    for i,v in pairs(cors) do
    spawn(function()
    pcall(v)
    end)
    end
    end
})


Tab:AddButton({
    Name = "Destroy",
    Callback = function()
        -- Assuming OrionLib is defined somewhere else
        OrionLib:Destroy()
    end
})

--end of code
OrionLib:Init() 
