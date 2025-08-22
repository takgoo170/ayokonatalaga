-- APT APT — MADE BY TAKGOO


local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local slapbattles = 6403373529
local slapbattles2 = 124596094333302
local slapbattles3 = 9015014224
local slapbattlesks = 11520107397
local evilbarzil = 80420091630966
local slaproyale = 9431156611
local slaproyalewaiting = 9426795465
local eternalbob = 13833961666

local currentPlaceId = game.PlaceId
if currentPlaceId == slapbattles or currentPlaceId == slapbattles2 or currentPlaceId == slapbattles3 then
  
local redz_ui = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
local Window = redz_ui:MakeWindow({
      Title = "Kai Hub | Slap Battles",
      Subtitle = "by Takgoo",
      SaveFolder = "save"
    })

Window:AddMinimizeButton({
      Button = { Image = "", Background Transparency = 0 },
      Corner = { CornerRadius = UDim.new(35, 1) },
    })


local maintab = Window:MakeTab({"Main", "home"})
local antitab = Window:MakeTab({"Protection", "shield"})
local farmtab = Window:MakeTab({"Farm", "hand"})
local exptab = Window:MakeTab({"Exploits", "laptop"})
local teletab = Window:MakeTab({"Teleport", "locate"})
local funtab = Window:MakeTab({"Fun", "laugh"})
local modetab = Window:MakeTab({"Modes", "menu"})
local misctab = Window:MakeTab({"Misc", "settings"})

---------------- MAIN TAB ----------------
maintab:AddSection({"Community"})
maintab:AddDiscordInvite({
      Name = "Kai Hub | Community",
      Description = "Kai Hub's official discord community.",
      Logo = "",
      Invite = "https://discord.gg/",
    })

maintab:AddSection({"Slap Battles"})
maintab:AddButton("Remove Cooldown", function()
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local tool = character:FindFirstChildOfClass("Tool") or player.Backpack:FindFirstChildOfClass("Tool")
while character.Humanoid.Health ~= 0 do
local localscript = tool:FindFirstChildOfClass("LocalScript")
local localscriptclone = localscript:Clone()
localscriptclone = localscript:Clone()
localscriptclone:Clone()
localscript:Destroy()
localscriptclone.Parent = tool
wait(0.1)
end
end)

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local root = nil
local auraEnabled = false
local cachedRemotes = {}
local KSHitRemote = ReplicatedStorage:FindFirstChild("KSHit")
local auraConnection
local lastFireTime = 0
local function updateRoot()
	local character = LocalPlayer.Character
	if character then
		root = character:FindFirstChild("HumanoidRootPart")
	end
end

LocalPlayer.CharacterAdded:Connect(function(char)
	char:WaitForChild("HumanoidRootPart")
	updateRoot()
end)

if LocalPlayer.Character then
	updateRoot()
end

local function findEquippedGlove()
	local character = LocalPlayer.Character
	if not character then return nil end
	for _, tool in ipairs(character:GetChildren()) do
		if tool:IsA("Tool") then
			return tool
		end
	end
end

local function getClosestPlayer()
	local closest = nil
	local minDist = math.huge
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local distance = (player.Character.HumanoidRootPart.Position - root.Position).Magnitude
			if distance < minDist then
				minDist = distance
				closest = player
			end
		end
	end
	return closest
end

local function findRelevantHitRemotes(gloveName)
	if cachedRemotes[gloveName] then return cachedRemotes[gloveName] end
	local nameLower = string.lower(gloveName or "")
	local hits = {}
	for _, obj in ipairs(ReplicatedStorage:GetDescendants()) do
		if obj:IsA("RemoteEvent") then
			local remoteLower = string.lower(obj.Name)
			if remoteLower == nameLower .. "hi" or (remoteLower:find(nameLower) and remoteLower:find("hit")) then
				table.insert(hits, obj)
			end
		end
	end
	cachedRemotes[gloveName] = hits
	return hits
  end


maintab:AddButton("Slap Aura", function()
	auraEnabled = not auraEnabled
	notify("Slap Aura", auraEnabled and "Enabled." or "Disabled.")
	if auraEnabled then
		if auraConnection then
			auraConnection:Disconnect()
			auraConnection = nil
		end
		auraConnection = RunService.Heartbeat:Connect(function()
			local currentTime = os.clock()
			if currentTime - lastFireTime < 0.7 then return end
			lastFireTime = currentTime

			if not root then return end
			local target = getClosestPlayer()
			if not target or not target.Character then return end
			local targetRoot = target.Character:FindFirstChild("HumanoidRootPart")
			if not targetRoot then return end

			local glove = findEquippedGlove()
			local remotes = {}

			if glove then
				local foundRemotes = findRelevantHitRemotes(glove.Name)
				if foundRemotes and #foundRemotes > 0 then
					remotes = foundRemotes
				end
			end

			if #remotes == 0 then
				if KSHitRemote then
					table.insert(remotes, KSHitRemote)
				end
				for _, fallback in ipairs({"GeneralHit", "b"}) do
					local remote = ReplicatedStorage:FindFirstChild(fallback)
					if remote then
						table.insert(remotes, remote)
					end
				end
			end

			for _, remote in ipairs(remotes) do
				remote:FireServer(targetRoot)
			end
		end)
	else
		if auraConnection then
			auraConnection:Disconnect()
			auraConnection = nil
		end
	end
end)


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local range = 15
local cooldown = 1.450
local lastClick = 0
local enabled = false

local function emulateClick()
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, nil, 0)
	VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, nil, 0)
end

RunService.RenderStepped:Connect(function()
	if not enabled then return end

	local now = tick()
	if now - lastClick < cooldown then return end

	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local targetHRP = player.Character.HumanoidRootPart
			local dist = (HumanoidRootPart.Position - targetHRP.Position).Magnitude

			if dist <= range then
				emulateClick()
				lastClick = now
				break
			end
		end
	end
end)

maintab:AddButton("Glove Triggerbot", function()
    enabled = not enabled

    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Glove Triggerbot",
        Text = enabled and "Enabled." or "Disabled.",
        Duration = 2
    })
end)

maintab:AddButton("Spam Quake", "Must equip QUAKE first.", function()
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local remote = ReplicatedStorage:WaitForChild("QuakeQuake")

for i = 1, 250 do
    remote:FireServer({ start = true })
    remote:FireServer({ finished = true })
    task.wait() 
end
end)

maintab:AddButton("Bind Rhythm", "Binds To E, Equip Rhythm.", function()
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remote = ReplicatedStorage:WaitForChild("rhythmevent")

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.E then
        local args = {
            [1] = "AoeExplosion",
            [2] = 90
        }
        remote:FireServer(unpack(args))
    end
end)
end)


maintab:AddButton("Bind Kinetic", "Binds To R, Equip Kinetic.", function()
local UIS = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

UIS.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.R then
        local player = Players.LocalPlayer
        local glove = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Glove")

        if glove and glove.Value == "Kinetic" then
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local OGL = character.HumanoidRootPart.CFrame
                for i = 1, 100 do
                    ReplicatedStorage.SelfKnockback:FireServer({
                        ["Force"] = 0,
                        ["Direction"] = Vector3.new(0, 0.01, 0)
                    })
                    task.wait(0.05)
                end
            end
        else
            StarterGui:SetCore("SendNotification", {
                Title = "Wrong Glove",
                Text = "Equip Kinetic Glove.",
                Duration = 10
            })
        end
    end
end)
end)


maintab:Button("Kick Leashed Player ", "Required Leash + Swapper", function()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

pcall(function()
	local brazil = Workspace.Lobby.brazil
	if brazil then
		brazil:Destroy()
	end
end)

local localPlayer = Players.LocalPlayer
local slocEvent = ReplicatedStorage:WaitForChild("SLOC")

local CLICK_TARGET = Workspace:WaitForChild("Lobby"):WaitForChild("Swapper")
local TELEPORT_PAD = Workspace:WaitForChild("Lobby"):WaitForChild("Teleport1")

local TWEEN_POSITION = Vector3.new(-441, 133, -21)
local TARGET_POSITION = Vector3.new(-439, 66, -14)

local function moveToPosition(hrp, targetPos, duration)
	local startPos = hrp.Position
	local startTime = tick()
	local endTime = startTime + duration

	while tick() < endTime do
		local alpha = math.clamp((tick() - startTime) / duration, 0, 1)
		local newPos = startPos:Lerp(targetPos, alpha)
		hrp.CFrame = CFrame.new(newPos)
		task.wait(0.03)
	end

	hrp.CFrame = CFrame.new(targetPos)
	hrp.Velocity = Vector3.zero
end

local function fireClickDetector(part)
	local clickDetector = part:FindFirstChildOfClass("ClickDetector")
	if clickDetector then
		fireclickdetector(clickDetector)
	end
end

local function walkInto(part)
	local character = localPlayer.Character
	if not character then return end
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local goalPos = part.Position + Vector3.new(0, 3, 0)
	hrp.CFrame = CFrame.new(goalPos)

	while (hrp.Position - part.Position).Magnitude > 5 do
		task.wait(0.05)
	end
end

local function onRespawn(character)
	local hrp = character:WaitForChild("HumanoidRootPart")

	fireClickDetector(CLICK_TARGET)
	walkInto(TELEPORT_PAD)
	task.wait(0.5)
	hrp.CFrame = CFrame.new(TARGET_POSITION)
	task.wait(0.3)
	slocEvent:FireServer()
    wait(1)

    local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")

    local placeId = game.PlaceId
    local jobId = game.JobId
    local player = Players.LocalPlayer or Players:GetPlayers()[1]

    if typeof(placeId) == "number" and typeof(jobId) == "string" and player then
        print("PlaceId:", placeId)
        print("JobId:", jobId)
        TeleportService:TeleportToPlaceInstance(placeId, jobId, player)
end
      end

local function startSequence()
	local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
	local hrp = character:WaitForChild("HumanoidRootPart")

	moveToPosition(hrp, TWEEN_POSITION, 3.5)

	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.Health = 0
	end
end

    localPlayer.CharacterAdded:Connect(onRespawn)
    startSequence()
end)

maintab:AddButton("Auto-Click Tycoon ", "MUST BE NEAR", function()
local VirtualInputManager = game:GetService("VirtualInputManager")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local Camera = Workspace.CurrentCamera

local function getClickPart()
    local player = Players.LocalPlayer
    local helper = Workspace:FindFirstChild("ÅTycoon" .. player.Name)
    if helper then
        return helper:FindFirstChild("Click")
    end
    return nil
end

local function simulateClick(part)
    local screenPoint = Camera:WorldToViewportPoint(part.Position)
    VirtualInputManager:SendMouseButtonEvent(screenPoint.X, screenPoint.Y, 0, true, game, 0)
    VirtualInputManager:SendMouseButtonEvent(screenPoint.X, screenPoint.Y, 0, false, game, 0)
end

local connection
connection = RunService.RenderStepped:Connect(function()
    local clickPart = getClickPart()
    if not clickPart then
        connection:Disconnect()
        return
    end

    simulateClick(clickPart)
end)
end)

local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local playerName = LocalPlayer.Name

local root = nil
local slappedValue = nil
local ragdolledValue = Instance.new("BoolValue")
ragdolledValue.Name = "Ragdolled"
ragdolledValue.Value = false
ragdolledValue.Parent = LocalPlayer

local antiFlingEnabled = false

local function notify(title, text)
	pcall(function()
		StarterGui:SetCore("SendNotification", {
			Title = title;
			Text = text;
			Duration = 3,
		})
	end)
end

local function freezePlayer(source)
	if not antiFlingEnabled or not root then return end

	root.AssemblyLinearVelocity = Vector3.zero
	root.AssemblyAngularVelocity = Vector3.zero
	root.Anchored = true

	task.delay(2, function()
		if root then
			root.Anchored = false
		end
	end)
end

RunService.Heartbeat:Connect(function()
	if antiFlingEnabled and ragdolledValue and ragdolledValue.Value == true then
		freezePlayer("Ragdolled")
	end
end)

local function setupCharacter(character)
	root = character:WaitForChild("HumanoidRootPart")

	local localFolder = Workspace:FindFirstChild(playerName)
	if localFolder then
		slappedValue = localFolder:FindFirstChild("LastSlappedBy")
		ragdolledValue = localFolder:FindFirstChild("Ragdolled") or ragdolledValue
	end

	if slappedValue then
		slappedValue.Changed:Connect(function(newValue)
			if antiFlingEnabled and newValue and newValue ~= "" then
				freezePlayer("Slapped")
			end
		end)
	end
end

if LocalPlayer.Character then
	setupCharacter(LocalPlayer.Character)
end

LocalPlayer.CharacterAdded:Connect(setupCharacter)
