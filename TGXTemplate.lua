local a = {}
local connections = {}

local poses = {
idle = "no",
jump = "no",
fall = "no",
walk = "no",
run = "no"
}

getfenv().sine = 1

function a:Reanimate(method,clickfling)
local clickfling = clickfling or false
if method == "SP" then
HumanDied = false

local plr = game.Players.LocalPlayer
local char = plr.Character
local srv = game:GetService('RunService')
local ct = {}

char.Archivable = true
local reanim = char:Clone()
reanim.Name = 'Tangerex '..plr.Name..''
fl=Instance.new('Folder',char) fl.Name ='Tangerex'
reanim.Animate.Disabled=true
char.HumanoidRootPart:Destroy()
char.Humanoid:ChangeState(16)

for i,v in next, char.Humanoid:GetPlayingAnimationTracks() do
v:Stop()
end
char.Animate:Remove()

for i,v in next, game.Players.LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") then
table.insert(ct,srv.Heartbeat:Connect(function()
v.Velocity = Vector3.new(17.325,17.325,17.325)
end))
end
end

function create(part, parent, p, r)
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("AlignOrientation",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name
parent.Attachment.Name = part.Name
part.AlignPosition.Attachment0 = part[part.Name]
part.AlignOrientation.Attachment0 = part[part.Name]
part.AlignPosition.Attachment1 = parent[part.Name]
part.AlignOrientation.Attachment1 = parent[part.Name]
parent[part.Name].Position = p or Vector3.new()
part[part.Name].Orientation = r or Vector3.new()
part.AlignPosition.MaxForce = 1e+35
part.AlignPosition.MaxVelocity = 1e+35
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = 1e+35
part.AlignOrientation.Responsiveness = 1e+35
part.AlignPosition.RigidityEnabled = false
part.AlignOrientation.MaxTorque = 1e+35
end

for i,v in next, char:GetDescendants() do
if v:IsA('Accessory') then
v.Handle:BreakJoints()
create(v.Handle,reanim[v.Name].Handle)
end
end

char.Torso['Left Shoulder']:Destroy()
char.Torso['Right Shoulder']:Destroy()
char.Torso['Left Hip']:Destroy()
char.Torso['Right Hip']:Destroy()

create(char['Torso'],reanim['Torso'])
create(char['Left Arm'],reanim['Left Arm'])
create(char['Right Arm'],reanim['Right Arm'])
create(char['Left Leg'],reanim['Left Leg'])
create(char['Right Leg'],reanim['Right Leg'])

for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') or v:IsA('Decal') then v.Transparency = 1 end end

reanim.Parent = fl

for i,v in next, reanim:GetDescendants() do
if v:IsA('BasePart') then
table.insert(ct,srv.RenderStepped:Connect(function()
v.CanCollide = false
end))
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('BasePart') then
table.insert(ct,srv.RenderStepped:Connect(function()
v.CanCollide = false
end))
end
end

for i,v in next, reanim:GetDescendants() do
if v:IsA('BasePart') then
table.insert(ct,srv.Stepped:Connect(function()
v.CanCollide = false
end))
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('BasePart') then
table.insert(ct,srv.Stepped:Connect(function()
v.CanCollide = false
end))
end
end

table.insert(ct,reanim.Humanoid.Died:Connect(function()
plr.Character = char
char:BreakJoints()
reanim:Destroy()
game.Players:Chat('-gr')
HumanDied = true
for _,v in pairs(ct) do v:Disconnect() end
end))

plr.Character = reanim
workspace.CurrentCamera.CameraSubject = reanim.Humanoid
elseif method == "TF" then
HumanDied = false
for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~= 'Torso' and v.Name ~= 'Head' then 
_G.netless=game:GetService("RunService").Heartbeat:connect(function()
v.Velocity = Vector3.new(-30,0,0)
sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999)
end)
end
end

local plr = game.Players.LocalPlayer
local char = plr.Character
local srv = game:GetService('RunService')
local ct = {}

char.Archivable = true
local reanim = char:Clone()
reanim.Name = 'Tangerex '..plr.Name..''
fl=Instance.new('Folder',char) fl.Name ='Tangerex'
reanim.Animate.Disabled=true
char.HumanoidRootPart:Destroy()
char.Humanoid:ChangeState(16)

for i,v in next, char.Humanoid:GetPlayingAnimationTracks() do
v:Stop()
end
char.Animate:Remove()

function create(part, parent, p, r)
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("AlignOrientation",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name
parent.Attachment.Name = part.Name
part.AlignPosition.Attachment0 = part[part.Name]
part.AlignOrientation.Attachment0 = part[part.Name]
part.AlignPosition.Attachment1 = parent[part.Name]
part.AlignOrientation.Attachment1 = parent[part.Name]
parent[part.Name].Position = p or Vector3.new()
part[part.Name].Orientation = r or Vector3.new()
part.AlignPosition.MaxForce = 999999999
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
part.AlignOrientation.Responsiveness = math.huge
part.AlignPosition.RigidityEnabled = false
part.AlignOrientation.MaxTorque = 999999999
end

for i,v in next, char:GetDescendants() do
if v:IsA('Accessory') then
v.Handle:BreakJoints()
create(v.Handle,reanim[v.Name].Handle)
end
end

char.Torso['Left Shoulder']:Destroy()
char.Torso['Right Shoulder']:Destroy()
char.Torso['Left Hip']:Destroy()
char.Torso['Right Hip']:Destroy()

create(char['Torso'],reanim['Torso'])
create(char['Left Arm'],reanim['Left Arm'])
create(char['Right Arm'],reanim['Right Arm'])
create(char['Left Leg'],reanim['Left Leg'])
create(char['Right Leg'],reanim['Right Leg'])

for i,v in next, reanim:GetDescendants() do if v:IsA('BasePart') or v:IsA('Decal') then v.Transparency = 1 end end

reanim.Parent = fl

table.insert(ct,srv.Heartbeat:Connect(function()
char.Torso.CFrame=reanim.Torso.CFrame
char.Torso.Velocity=Vector3.new(40000,40000,0)
end))

for i,v in next, reanim:GetDescendants() do
if v:IsA('BasePart') then
table.insert(ct,srv.RenderStepped:Connect(function()
v.CanCollide = false
end))
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('BasePart') then
table.insert(ct,srv.RenderStepped:Connect(function()
v.CanCollide = false
end))
end
end

for i,v in next, reanim:GetDescendants() do
if v:IsA('BasePart') then
table.insert(ct,srv.Stepped:Connect(function()
v.CanCollide = false
end))
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('BasePart') then
table.insert(ct,srv.Stepped:Connect(function()
v.CanCollide = false
end))
end
end

table.insert(ct,reanim.Humanoid.Died:Connect(function()
plr.Character = char
char:BreakJoints()
reanim:Destroy()
game.Players:Chat('-gr')
_G.netless:Disconnect()
HumanDied = true
for _,v in pairs(ct) do v:Disconnect() end
end))

plr.Character = reanim
workspace.CurrentCamera.CameraSubject = reanim.Humanoid
elseif method == "LF" then
local plr = game.Players.LocalPlayer
local char = plr.Character
local srv = game:GetService('RunService')
local ct = {}
local te = table.insert
local m = plr:GetMouse()

if char:FindFirstChild('Pal Hair') then else notf('You need Pal Hair.','10') return end

_G.Jitter=Vector3.new(0,30,0)

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") and v.Name ~= 'HumanoidRootPart' then 
bf=Instance.new('BodyForce',v)
bf.Force=Vector3.new(50,50,50)
te(ct,game:GetService("RunService").Heartbeat:connect(function()
pcall(function()
v.Velocity = _G.Jitter
v.BodyForce.Force=Vector3.new(50,50,50)
game.Players.LocalPlayer.ReplicationFocus=workspace
sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",9e9)
end)
end))
end
end

char.Archivable = true
fl=Instance.new('Folder',char) fl.Name = 'ArmFling'
local reanim = char:Clone()
char.Humanoid:ChangeState(16)
char.HumanoidRootPart:Destroy()

for i,v in next, char.Humanoid:GetPlayingAnimationTracks() do
v:Stop()
end
char.Animate:Remove()

hats=0
function create(part, parent, p, r)
hats=hats+1
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("AlignOrientation",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name..hats
parent.Attachment.Name = part.Name..hats
part.AlignPosition.Attachment0 = part[part.Name..hats]
part.AlignOrientation.Attachment0 = part[part.Name..hats]
part.AlignPosition.Attachment1 = parent[part.Name..hats]
part.AlignOrientation.Attachment1 = parent[part.Name..hats]
parent[part.Name..hats].Position = p or Vector3.new()
part[part.Name..hats].Orientation = r or Vector3.new()
part.AlignPosition.MaxForce = 999999999
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
part.AlignOrientation.Responsiveness = math.huge
part.AlignPosition.RigidityEnabled = false
part.AlignOrientation.MaxTorque = 999999999
end

function Pos(part, parent, p)
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name
parent.Attachment.Name = part.Name
part.AlignPosition.Attachment0 = part[part.Name]
part.AlignPosition.Attachment1 = parent[part.Name]
parent[part.Name].Position = p or Vector3.new()
part.AlignPosition.MaxForce = 999999999*10
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
part.AlignPosition.RigidityEnabled = false
end

function nc(p)
if p:IsA('BasePart') or p:IsA('Part') then
te(ct,srv.Stepped:Connect(function()
p.CanCollide=false
end))
te(ct,srv.RenderStepped:Connect(function()
p.CanCollide=false
end))
else
print('Cannot noclip '..p)
end
end

function af()
for i,v in next, game.Players:GetDescendants() do
if v:IsA('Player') and v.Name ~= game.Players.LocalPlayer.Name then
for _,c in next, v.Character:GetDescendants() do
if c:IsA('BasePart') and v.Parent== char then
noo=Instance.new('NoCollisionConstraint',c)
noo.Part1=char['Torso']
noo.Part0=c
noo2=Instance.new('NoCollisionConstraint',c)
noo2.Part1=char['Head']
noo2.Part0=c
end
end
end
end
end

for i,v in next, reanim:GetDescendants() do
if v:IsA('BasePart') or v:IsA('Decal') then
v.Transparency = 1
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('BasePart') then
nc(v)
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('Accessory') and v.Name ~= 'Pal Hair' then
v.Handle:BreakJoints()
create(v.Handle,reanim[v.Name].Handle)
end
end

for i,v in next, reanim:GetDescendants() do
if v:IsA('BasePart') then
nc(v)
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('Motor6D') and v.Name ~= 'Neck' then
v:Destroy()
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('BasePart') and v.Name ~= 'Right Leg' and v.Name ~= 'Head' and v.Parent == char then
create(v,reanim[v.Name])
end
end

function flinger(p)
f=Instance.new('BodyAngularVelocity',p)
f.P=9e9*10
f.AngularVelocity = Vector3.new(9e9*10,9e9*10,9e9*10)
f.MaxTorque=Vector3.new(9e9*10,0,0)
return f
end

Pos(char['Right Leg'],reanim['Torso'])
fliiiin=flinger(char['Right Leg'])

char['Pal Hair'].Handle:BreakJoints()
char['Pal Hair'].Handle.Mesh:Destroy()

create(char['Pal Hair'].Handle,reanim['Right Leg'],Vector3.new(),Vector3.new(90,0,0))

reanim.Animate.Disabled=true

reanim.Parent=fl

sh=false

fp=Instance.new('Part',reanim)
fp.Name='FlingPart'
fp.CanCollide=false
fp.Transparency=1

te(ct,m.Button1Down:Connect(function()
sh=true
end))

te(ct,m.Button1Up:Connect(function()
sh=false
end))

char = workspace[plr.Name]

te(ct,srv.Heartbeat:Connect(function()
m.TargetFilter=char
if sh then
fp.CFrame=CFrame.new(m.Hit.p)
char['Right Leg'].Position=fp.Position
else
fp.CFrame=char.Torso.CFrame*CFrame.new(0,0,0)
char['Right Leg'].Position=fp.Position
end
end))

plr.Character=reanim
workspace.Camera.CameraSubject=reanim

HumanDied=false

te(ct,reanim.Humanoid.Died:Connect(function()
HumanDied=true
fliiiin:Destroy()
reanim.HumanoidRootPart.Anchored=true
old=reanim.HumanoidRootPart.CFrame
reanim.HumanoidRootPart.CFrame=old
wait()
reanim.HumanoidRootPart.CFrame=old
char.Humanoid:Destroy()
Instance.new('Humanoid',char)
plr.Character=char
char:BreakJoints()
game.Players:Chat('-gr')
for i,v in next, ct do v:Disconnect() end
end))
elseif method == "PD" then
plr = game.Players.LocalPlayer
char=game.Players.LocalPlayer.Character
ct={}
te=table.insert

HumanDied=false

for i,v in next, game:GetService("Players").LocalPlayer.Character:GetDescendants() do
if v:IsA("BasePart") then 
te(ct,game:GetService("RunService").Heartbeat:connect(function()
pcall(function()
v.Velocity = Vector3.new(0,-30,0)
sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999)
game.Players.LocalPlayer.ReplicationFocus = workspace
end)
end))
end
end

function notify(t,tex,dur)
game.StarterGui:SetCore("SendNotification", {
    Title = t; 
    Text = tex; 
    Duration = dur or 5;
})
end

local srv= game:GetService("RunService")

fl=Instance.new('Folder',char);fl.Name='CWExtra'

char.Archivable = true
local reanim = char:Clone()
reanim.Name='TangerexPD'
reanim.Animate.Disabled = true

for i,v in next, reanim:GetDescendants() do
if v:IsA('BasePart') or v:IsA('Decal') then
v.Transparency = 1 
end 
end

--flinge = false

penis=5.65
plr.Character=nil
plr.Character=char
char.Humanoid.AutoRotate=false
char.Humanoid.WalkSpeed=0
char.Humanoid.JumpPower=0
char.Torso.Anchored = true
notify('Tangerex ','Reanimating...\nPlease wait '..penis..' seconds.')
wait(penis)
char.Torso.Anchored=false
notify('Tangerex ','Reanimated..')
char.Humanoid.Health=0
--reanim.Humanoid.AutoRotate=false
reanim.Parent = fl
reanim.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame*CFrame.new(0,5,0)

function create(part, parent, p, r)
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("AlignOrientation",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name
parent.Attachment.Name = part.Name
part.AlignPosition.Attachment0 = part[part.Name]
part.AlignOrientation.Attachment0 = part[part.Name]
part.AlignPosition.Attachment1 = parent[part.Name]
part.AlignOrientation.Attachment1 = parent[part.Name]
parent[part.Name].Position = p or Vector3.new()
part[part.Name].Orientation = r or Vector3.new()
part.AlignPosition.MaxForce = 999999999
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
part.AlignOrientation.Responsiveness = math.huge
part.AlignPosition.RigidityEnabled = false
part.AlignOrientation.MaxTorque = 999999999
part.Massless=true
end

function Pos(part, parent, p)
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name
parent.Attachment.Name = part.Name
part.AlignPosition.Attachment0 = part[part.Name]
--part.AlignOrientation.Attachment0 = part[part.Name]
part.AlignPosition.Attachment1 = parent[part.Name]
--part.AlignOrientation.Attachment1 = parent[part.Name]
parent[part.Name].Position = p or Vector3.new()
part.AlignPosition.MaxForce = 999999999
part.AlignPosition.MaxVelocity = math.huge
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = math.huge
--part.AlignOrientation.Responsiveness = math.huge
--part.AlignPosition.RigidityEnabled = false
--part.AlignOrientation.MaxTorque = 999999999
part.Massless=true
end

for i,part in next, char:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.RenderStepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,part in next, char:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.Stepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,part in next, reanim:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.RenderStepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,part in next, reanim:GetDescendants() do
if part:IsA('BasePart') then
te(ct,srv.Stepped:Connect(function()
part.CanCollide=false
end))
end
end

for i,v in next, char:GetDescendants() do
if v:IsA('Accessory') then
create(v.Handle,reanim[v.Name].Handle)
end
end

--Pos(fhrp,reanim['Torso'])
create(char['Head'],reanim['Head'])
create(char['Torso'],reanim['Torso'])
Pos(char['HumanoidRootPart'],reanim['Torso'],Vector3.new(0,0,0))
create(char['Right Arm'],reanim['Right Arm'])
create(char['Left Arm'],reanim['Left Arm'])
create(char['Right Leg'],reanim['Right Leg'])
create(char['Left Leg'],reanim['Left Leg'])

m = plr:GetMouse()

local LVecPart = Instance.new("Part", fl) LVecPart.CanCollide = false LVecPart.Transparency = 1

te(ct,srv.RenderStepped:Connect(function()
local lookVec = workspace.CurrentCamera.CFrame.lookVector
local Root = reanim["HumanoidRootPart"]
LVecPart.Position = Root.Position
LVecPart.CFrame = CFrame.new(LVecPart.Position, Vector3.new(lookVec.X * 10000, lookVec.Y, lookVec.Z * 10000))
end))

wdown=false
sdown=false
adown=false
ddown=false
spacedown=false

--reanim.HumanoidRootPart.RootJoint.Part0=nil

function flinger(p)
f=Instance.new('BodyAngularVelocity',p)
f.AngularVelocity = Vector3.new(9e9,9e9,9e9)
f.MaxTorque=Vector3.new(9e9,9e9,9e9)
end

flinger(char.HumanoidRootPart)

m=plr:GetMouse()

--char.HumanoidRootPart.Transparency = 0

bp=Instance.new('BodyPosition',char.HumanoidRootPart)
bp.P = 9e9
bp.D = 9e9
bp.MaxForce=Vector3.new(99999,99999,99999)

local click

te(ct,srv.Heartbeat:Connect(function()
if click == true then
bp.Position=m.Hit.p
char.HumanoidRootPart.Position=m.Hit.p
else
bp.Position=reanim.Torso.Position
char.HumanoidRootPart.Position=reanim.Torso.Position
end
end))

local Highlight = Instance.new("SelectionBox")
Highlight.Adornee = char.HumanoidRootPart
Highlight.LineThickness=0.02
Highlight.Color3 = Color3.fromRGB(120,0,0)
Highlight.Parent = char.HumanoidRootPart
Highlight.Name = "RAINBOW"

te(ct,m.Button1Down:Connect(function()
click=true
end))

te(ct,m.Button1Up:Connect(function()
click=false
end))

te(ct,m.KeyDown:Connect(function(e)
if e ==' ' then
spacedown=true end
if e =='w' then
wdown=true end
if e =='s' then
sdown=true end
if e =='a' then
adown=true end
if e =='d' then
ddown=true
end
end))

te(ct,m.KeyUp:Connect(function(e)
if e ==' ' then
spacedown=false end
if e =='w' then
wdown=false end
if e =='s' then
sdown=false end
if e =='a' then
adown=false end
if e =='d' then
ddown=false
end
end))

local function MoveClone(X,Y,Z)
LVecPart.CFrame = LVecPart.CFrame * CFrame.new(-X,Y,-Z)
reanim.Humanoid.WalkToPoint = LVecPart.Position
end

te(ct,srv.RenderStepped:Connect(function()
if wdown==true then
MoveClone(0,0,1e4) end
if sdown==true then
MoveClone(0,0,-1e4) end
if adown==true then
MoveClone(1e4,0,0) end
if ddown==true then
MoveClone(-1e4,0,0)
end
if spacedown==true then
reanim.Humanoid.Jump=true end
if wdown ~= true and adown ~= true and sdown ~= true and ddown ~= true then
reanim.Humanoid.WalkToPoint = reanim.HumanoidRootPart.Position end
end))

--reanim.HumanoidRootPart.RootJoint.Part1=nil

workspace.CurrentCamera.CameraSubject = reanim.Humanoid

reset=Instance.new('BindableEvent')
te(ct,reset.Event:Connect(function()
reanim:Destroy()
HumanDied=true
reanimated=false
for i,v in next, char:GetDescendants() do if v:IsA('BasePart') then v.Anchored=true end end
hc=char.Humanoid:Clone()
char.Humanoid:Destroy()
hc.Parent=char
game.Players:Chat('-re')
for i,v in pairs(ct) do v:Disconnect() end
game:GetService("StarterGui"):SetCore("ResetButtonCallback", true)
reset:Remove()
end))

game:GetService("StarterGui"):SetCore("ResetButtonCallback", reset)
elseif method == "R15toR6" then
function notf(str,sec)
game.StarterGui:SetCore("SendNotification", {
    Title ="Tangerex ";
    Text = str or "Text";
    Icon = "";
    Duration = sec or "16";
})
end

if game.Players.LocalPlayer.Character.Humanoid.RigType ~= "R15" then
notf("Switch your character rig type to r15, To use it.") return end

local plr = game.Players.LocalPlayer
local char = plr.Character
local srv = game:GetService("RunService")
local te = table.insert
local ct = {}

for i,v in next, char:GetDescendants() do if v:IsA("BallSocketConstraint") or v:IsA("HingeConstraint") then v:Destroy() end end

local fl = Instance.new("Folder",char)
fl.Name = "Tangerex R15ToR6"

local r6rig = game:GetObjects("rbxassetid://1561389244")[1]
r6rig.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame

parts = 0
function create(part, parent, p, r)
parts = parts + 1
Instance.new("Attachment",part)
Instance.new("AlignPosition",part)
Instance.new("AlignOrientation",part)
Instance.new("Attachment",parent)
part.Attachment.Name = part.Name..parts
parent.Attachment.Name = part.Name..parts
part.AlignPosition.Attachment0 = part[part.Name..parts]
part.AlignOrientation.Attachment0 = part[part.Name..parts]
part.AlignPosition.Attachment1 = parent[part.Name..parts]
part.AlignOrientation.Attachment1 = parent[part.Name..parts]
parent[part.Name..parts].Position = p or Vector3.new()
part[part.Name..parts].Orientation = r or Vector3.new()
part.AlignPosition.MaxForce = 1e+35
part.AlignPosition.MaxVelocity = 1e+35
part.AlignPosition.ReactionForceEnabled = false
part.AlignPosition.Responsiveness = 1e+35
part.AlignOrientation.Responsiveness = 1e+35
part.AlignPosition.RigidityEnabled = false
part.AlignOrientation.MaxTorque = 1e+35
te(ct,srv.Stepped:Connect(function()
part:ApplyImpulse(Vector3.new(-30,0,0))
part.Velocity = Vector3.new(30,0,0)
parent.CanCollide = false
part.CanCollide = false
part.CFrame = parent.CFrame*CFrame.new(p or Vector3.new())
end))
te(ct,srv.Heartbeat:Connect(function()
part:ApplyImpulse(Vector3.new(-30,0,0))
part.Velocity = Vector3.new(30,0,0)
part.CFrame = parent.CFrame*CFrame.new(p or Vector3.new())
sethiddenproperty(game.Players.LocalPlayer,"MaximumSimulationRadius",math.huge)
sethiddenproperty(game.Players.LocalPlayer,"SimulationRadius",999999999)
end))
end

te(ct,r6rig.Humanoid.Died:Connect(function()
for i,v in next, ct do
v:Disconnect()
end
plr.Character=char
char:BreakJoints()
char.Humanoid:Destroy()
Instance.new("Humanoid",char)
game.Players:Chat("-re")
end))

for i,v in next, char.Humanoid:GetPlayingAnimationTracks() do
v:Stop()
end
char.Animate:Remove()

for i,v in next, char:GetDescendants() do
if v:IsA("Motor6D") and v.Name ~= "Neck" then
v:Destroy()
end
end

for i,v in next, r6rig:GetDescendants() do
if v:IsA("BasePart") or v:IsA("Decal") then
v.Transparency = 1
end
end

for i,v in next, char:GetDescendants() do
if v:IsA("Accessory") then
hclone = v:Clone()
hclone.Handle.AccessoryWeld:Remove()
hclone.Handle:BreakJoints()
hclone.Handle.Transparency = 1
r6rig.Humanoid:AddAccessory(hclone)
--v.Handle:BreakJoints()
--create(v.Handle,hclone.Handle)
end
end

te(ct,srv.Stepped:Connect(function()
r6rig.Head.CanCollide = false
end))

r6rig.Parent = fl

char.Humanoid:ChangeState(16)

create(char.UpperTorso,r6rig.Torso,Vector3.new(0,0.2,0))
create(char.LowerTorso,r6rig.Torso,Vector3.new(0,-0.8,0))

create(char.LeftUpperArm,r6rig["Left Arm"],Vector3.new(0,0.4,0))
create(char.LeftLowerArm,r6rig["Left Arm"],Vector3.new(0,-0.2,0))
create(char.LeftHand,r6rig["Left Arm"],Vector3.new(0,-0.85,0))

create(char.RightUpperArm,r6rig["Right Arm"],Vector3.new(0,0.4,0))
create(char.RightLowerArm,r6rig["Right Arm"],Vector3.new(0,-0.2,0))
create(char.RightHand,r6rig["Right Arm"],Vector3.new(0,-0.85,0))

create(char.LeftUpperLeg,r6rig["Left Leg"],Vector3.new(0,0.6,0))
create(char.LeftLowerLeg,r6rig["Left Leg"],Vector3.new(0,-0.2,0))
create(char.LeftFoot,r6rig["Left Leg"],Vector3.new(0,-0.85,0))

create(char.RightUpperLeg,r6rig["Right Leg"],Vector3.new(0,0.6,0))
create(char.RightLowerLeg,r6rig["Right Leg"],Vector3.new(0,-0.2,0))
create(char.RightFoot,r6rig["Right Leg"],Vector3.new(0,-0.85,0))

create(char.HumanoidRootPart,char["UpperTorso"],Vector3.new(0,0,0))

plr.Character = r6rig
workspace.Camera.CameraSubject = r6rig.Humanoid
elseif method == "Custom" then
end

local b = {}

local character = workspace.Camera.CameraSubject.Parent

getfenv().CF = CFrame.new
getfenv().RAD = math.rad
getfenv().ANGLES = CFrame.Angles

getfenv().RJ = character.HumanoidRootPart.RootJoint
getfenv().NECK = character.Torso.Neck
getfenv().RS = character.Torso['Right Shoulder']
getfenv().LS = character.Torso['Left Shoulder']
getfenv().RH = character.Torso['Right Hip']
getfenv().LH = character.Torso['Left Hip']
RJ.C1 = CF(0,-1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RJ.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
NECK.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
NECK.C1 = CF(0,-0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C1 = CF(0,0.5,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C1 = CF(0,1,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LH.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
RS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))
LS.C0 = CF(0,0,0)*ANGLES(RAD(0),RAD(0),RAD(0))

local Mode = "Normal"

local customanims = {}
local custom_modes = {}

loop = game:GetService("RunService").RenderStepped:Connect(function()
character = workspace.Camera.CameraSubject.Parent
if character.Humanoid.Health < 1 then
for i,v in next, connections do
v:Disconnect()
end
loop:Disconnect()
end
sine = sine + 1
Root = character.Humanoid.RootPart
local rlegray = Ray.new(character["Right Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local rlegpart, rlegendPoint = workspace:FindPartOnRay(rlegray, character)
local llegray = Ray.new(character["Left Leg"].Position + Vector3.new(0, 0.5, 0), Vector3.new(0, -2, 0))
local llegpart, llegendPoint = workspace:FindPartOnRay(llegray, character)
local rightvector = (Root.Velocity * Root.CFrame.rightVector).X + (Root.Velocity * Root.CFrame.rightVector).Z
local lookvector = (Root.Velocity * Root.CFrame.lookVector).X + (Root.Velocity * Root.CFrame.lookVector).Z
if lookvector > character.Humanoid.WalkSpeed then
lookvector = character.Humanoid.WalkSpeed
end
if lookvector < -character.Humanoid.WalkSpeed then
lookvector = -character.Humanoid.WalkSpeed
end
if rightvector > character.Humanoid.WalkSpeed then
rightvector = character.Humanoid.WalkSpeed
end
if rightvector < -character.Humanoid.WalkSpeed then
rightvector = -character.Humanoid.WalkSpeed
end
getfenv().lookvel = lookvector / character.Humanoid.WalkSpeed
getfenv().rightvel = rightvector / character.Humanoid.WalkSpeed
if Mode == "Normal" then
if Root.Velocity.y > 1 and poses.jump ~= "no" then -- jump
poses.jump()
elseif Root.Velocity.y < -1 and poses.fall ~= "no" then -- fall
poses.fall()
elseif Root.Velocity.Magnitude < 2 and poses.idle ~= "no" then -- idle
poses.idle()
elseif Root.Velocity.Magnitude < 20 and poses.walk ~= "no" then -- walk
poses.walk()
elseif Root.Velocity.Magnitude > 20 and poses.run ~= "no" then -- run
poses.run()
end
end

for i,v in next, custom_modes do
if Mode == i then
custom_modes[i][1]()
end
end
--end)
end)

function b:Hat(hat,part,mesh,callback)
hat = hat or nil
part = part or nil
character[hat].Handle.AccessoryWeld.C1 = CFrame.new()
character[hat].Handle.AccessoryWeld.Part1 = character[part]
if mesh == true and workspace[game.Players.LocalPlayer.Name][hat].Handle:FindFirstChildOfClass("SpecialMesh") then
local oldchar = game.Players.LocalPlayer.Character
game.Players.LocalPlayer.Character = workspace[game.Players.LocalPlayer.Name]
wait()
workspace[game.Players.LocalPlayer.Name][hat].Handle:FindFirstChildOfClass("SpecialMesh"):Destroy()
wait()
game.Players.LocalPlayer.Character = oldchar
end
callback(hat)
end

function b:HatSetPart1(hat,part)
character[hat].Handle.AccessoryWeld.Part1 = character[part]
end

function b:Animation(pose,callback)
if not callback then error("Lerp needed to use.") end
if pose == "idle" then
poses.idle = callback
elseif pose == "jump" then
poses.jump = callback
elseif pose == "fall" then
poses.fall = callback
elseif pose == "walk" then
poses.walk = callback
elseif pose == "run" then
poses.run = callback
end
end

function b:NewAnimation(pose,callback)
customanims[pose] = {callback,pose}
end

function b:SetAnimation(animation,duration)
Mode = "Custom"
for i = 1, duration*2, 0.1 do
wait()
customanims[animation][1]()
end
Mode = "Normal"
end

function b:NewMode(pose,callback)
custom_modes[pose] = {callback,pose}
end

function b:SetMode(animation)
Mode = animation
end

function b:ResetMode()
Mode = "Normal"
end

function b:Keybind(key,callback)
mouse = game.Players.LocalPlayer:GetMouse()
table.insert(connections,mouse.KeyDown:Connect(function(k)
if k == key:lower() then
callback(true)
end
end))
end

function b:Clickbind(ud,ot,callback)
mouse = game.Players.LocalPlayer:GetMouse()
table.insert(connections,mouse["Button"..ot..ud]:Connect(function(k)
callback(true)
end))
end
return b
end

return a
