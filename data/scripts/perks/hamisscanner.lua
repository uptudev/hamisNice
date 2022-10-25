dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local pos_x, pos_y = EntityGetTransform( entity_id )

pos_y = pos_y - 4 -- offset to middle of character

local range = 25

-- ping nearby entity to check for HAMIS
entities = EntityGetInRadiusWithTag( pos_x, pos_y, range, "hamis")

if not next(entities) then
	print("no Hamis :(")
	HAMISNEAR = false
else
	if HAMISNEAR == false then dofile_once("data/scripts/text_prompt.lua") end
	print("Hamis :)")
	HAMISNEAR = true
end