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
	Name = "Anti-Ban",
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
	Name = "Clock",
	Callback = function()
        local s = game.Players.LocalPlayer.PlayerGui.MainGui:FindFirstChild("Scoreboard")
        local Message = s.Parent.Message
        
        s.Position = UDim2.new(1, 0, -0.02, 0)
        
        local fileName = "LFG-FF.csv"
        
        local function updateData()
            local clock = s.Clock.Text
            local pclock = s.Playclock.TextLabel.Text
            local status = s.Status.Text
            local homescore = s.HomeScore.TextLabel.Text
            local awayscore = s.AwayScore.TextLabel.Text
            local fgYards = tonumber(s.Yardline.Text) + 17
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
        
        s.Clock:GetPropertyChangedSignal("Text"):Connect(updateData)
        s.Yardline:GetPropertyChangedSignal("Text"):Connect(updateData)
        s.Status:GetPropertyChangedSignal("Text"):Connect(updateData)
        s.Playclock.TextLabel:GetPropertyChangedSignal("Text"):Connect(updateData)
        s.HomeScore.TextLabel:GetPropertyChangedSignal("Text"):Connect(updateData)
        s.AwayScore.TextLabel:GetPropertyChangedSignal("Text"):Connect(updateData)
        
  	end    
})

local Section = Tab:AddSection({
	Name = "Staduim Scripts"
})

Tab:AddButton({
	Name = "RSPN Dome",
	Callback = function()
        local Players = game:GetService("Players")
        local ws = game:GetService("Workspace")
        
        -- Asset ID of the new model you want to replace the stadium with
        local newModelAssetId = "13981854192"
        
        -- Function to replace the stadium model
        local function replaceStadiumModel()
            -- Get the stadium model
            local stadium = ws.Models.Stadium
        
            -- Remove the existing stadium model
            stadium:Destroy()
        
            -- Load the new model using the asset ID
            local newModel = game:GetObjects("rbxassetid://" .. newModelAssetId)[1]
        
            -- Place the new model in the workspace
            newModel.Parent = ws.Models
            newModel.Name = "Stadium"
        end
        
        -- Call the function to replace the stadium model
        replaceStadiumModel()
        
        -- Get the Lighting service
        local Lighting = game:GetService("Lighting")
        
        -- Disable shadows for all light sources
        local lights = game.Workspace:GetDescendants()
        for _, light in ipairs(lights) do
            if light:IsA("Light") then
                light.Shadows = false -- Disable shadows for each light source
            end
        end
  	end    
})

Tab:AddButton({
	Name = "Bills Stadium",
	Callback = function()
        local Players = game:GetService("Players")
        local ws = game:GetService("Workspace")
        
        -- Asset ID of the new model you want to replace the stadium with
        local newModelAssetId = "17045890116"
        
        -- Function to replace the stadium model
        local function replaceStadiumModel()
            -- Get the stadium model
            local stadium = ws.Models.Stadium
        
            -- Remove the existing stadium model
            stadium:Destroy()
        
            -- Load the new model using the asset ID
            local newModel = game:GetObjects("rbxassetid://" .. newModelAssetId)[1]
        
            -- Place the new model in the workspace
            newModel.Parent = ws.Models
            newModel.Name = "Stadium"
        end
        
        -- Call the function to replace the stadium model
        replaceStadiumModel()
        
        -- Get the Lighting service
        local Lighting = game:GetService("Lighting")
        
        -- Disable shadows for all light sources
        local lights = game.Workspace:GetDescendants()
        for _, light in ipairs(lights) do
            if light:IsA("Light") then
                light.Shadows = false -- Disable shadows for each light source
            end
        end
  	end    
})

Tab:AddButton({
	Name = "Eagles Stadium",
	Callback = function()
        local Players = game:GetService("Players")
        local ws = game:GetService("Workspace")
        
        -- Asset ID of the new model you want to replace the stadium with
        local newModelAssetId = "17071455135"
        
        -- Function to replace the stadium model
        local function replaceStadiumModel()
            -- Get the stadium model
            local stadium = ws.Models.Stadium
        
            -- Remove the existing stadium model
            stadium:Destroy()
        
            -- Load the new model using the asset ID
            local newModel = game:GetObjects("rbxassetid://" .. newModelAssetId)[1]
        
            -- Place the new model in the workspace
            newModel.Parent = ws.Models
            newModel.Name = "Stadium"
        end
        
        -- Call the function to replace the stadium model
        replaceStadiumModel()
        
        -- Get the Lighting service
        local Lighting = game:GetService("Lighting")
        
        -- Disable shadows for all light sources
        local lights = game.Workspace:GetDescendants()
        for _, light in ipairs(lights) do
            if light:IsA("Light") then
                light.Shadows = false -- Disable shadows for each light source
            end
        end
  	end    
})

Tab:AddButton({
	Name = "Staduim Lighting",
	Callback = function()
      		OrionLib:MakeNotification({
	Name = "HAYDEN A MEANIE",
	Content = "There is nothing here hayden gave me a non working script",
	Image = "rbxassetid://4483345998",
	Time = 5
})
  	end    
})

local Section = Tab:AddSection({
	Name = "Skycam's"
})
Tab:AddButton({
    Name = "AutoCamera",
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
    Name = "Brodcast Camrea",
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
	Name = "Scorebug"
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
local Tab = Window:MakeTab({
    Name = "Basketball Legends",
    Icon = "rbxassetid://",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Nothing Yet!"
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
    Name = "Settings",
    Icon = "rbxassetid://",
    PremiumOnly = false
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