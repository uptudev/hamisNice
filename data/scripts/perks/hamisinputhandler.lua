dofile_once("data/scripts/lib/utilities.lua")
dofile_once("data/scripts/lib/coroutines.lua")
dofile_once("mods/hamisNice/data/scripts/perks/globals.lua")

dofile("mods/hamisNice/data/scripts/perks/hamisscanner.lua")

local entity_id = GetUpdatedEntityID()
local comps = EntityGetAllComponents(entity_id)
local concomp = nil
print("InputHandler started")

function checkKeyPress()
    print("HAMISNEAR true; getting control component")
    for i,v in ipairs(comps) do
        if ComponentGetTypeName(v) == "ControlsComponent" then concomp = v; break end
    end

    local mouse2input = ComponentGetValue(concomp, "mButtonDownRightClick")

    print(string.format("mouse2input == %d", mouse2input))
    print(string.format("FLAG == %s", FLAG))

    if mouse2input=="1" and FLAG==false then
        print("playing out anim")
        GamePlayAnimation(entity_id, "thumbout", 1)
        FLAG=true
        wait(24)
    elseif mouse2input=="1" and FLAG==true then
        print("playing hold anim")
        GamePlayAnimation(entity_id, "thumbhold", 1)
        wait(24)
    elseif mouse2input=="0" then
        print("playing stand anim")
        FLAG = false
        GamePlayAnimation(entity_id, "stand", 0)
        wait(24)
    end
end

if HAMISNEAR==true then async(
    function()
        checkKeyPress()
        print("checking for keypresses")
    end)
end