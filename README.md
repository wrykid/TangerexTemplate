# TangerexTemplate
(updated every time!!)

Tangerex Template.
This can be used to replace the down replit of tangerex template.

Template:

--put the remove hat mesh here

local tangerex = loadstring(game:HttpGet("https://31645703-63d0-4449-8f89-04447a57bcc6.id.repl.co/Tangerex/Template/main.lua"))()

reanimate = tangerex:Reanimate("SP",false --[[Usage: true or false to toggle click fling]]) -- SP / Simple, LF / Leg Fling, TF / Torso Fling, PD / Perma Death [Fling]

--Put the hat here

reanimate:Animation("idle",function()
--idlelerphere
end)

reanimate:Animation("walk",function()
--walklerphere
end)

reanimate:Animation("run",function()
--runlerphere
end)

reanimate:Animation("jump",function()
--jumplerphere
end)

reanimate:Animation("fall",function()
--falllerphere
end)



Other script stuff:

reanimate:NewAnimation("animation name",function()
--lerp here
end)

reanimate:SetAnimation("animation name",2 -- [[{Duration}]])

reanimate:Keybind("key",function()
--do anything you want
end)

reanimate:Clickbind("Down",1,function() -- [[1st Argument: Down = Hold , Up = Release 2nd Argument: 1 = left click , 2 = right click]]
--do anything you want
end)

-- Hat

reanimate:HatSetPart1("name of the hat","name of the part")

-- Modes

reanimate:NewMode("name of the mode",function()
local Root = workspace.Camera.CameraSubject.RootPart
if Root.Velocity.y > 1 then -- jump
--jump lerp here
elseif Root.Velocity.y < -1 then -- fall
--fall lerp here
elseif Root.Velocity.Magnitude < 2 then -- idle
--idle lerp here
elseif Root.Velocity.Magnitude < 20 then -- walk
--walk lerp here
elseif Root.Velocity.Magnitude > 20 then -- run
--run lerp here
end
end)

reanimate:SetMode("name of the mode")

Attack Click
reanimate:NewAnimation("Attack",function()
--lerp here
end)

reanimate:Clickbind("Down",1,function()
reanimate:SetAnimation("Attack",1) -- make the duration upper than 1 or just make it 1
end)

Remove Hat Mesh
game.Players.LocalPlayer.Character["hatname"].Handle:FindFirstChildOfClass("SpecialMesh"):Remove()

Its very easy to replace!
