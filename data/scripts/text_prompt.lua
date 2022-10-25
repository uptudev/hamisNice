dofile( "data/scripts/lib/coroutines.lua" )
dofile_once("data/scripts/lib/utilities.lua")

local gui = nil
local gui_frame_fn = nil


function wait_seconds( seconds )
	wait( seconds * 60 )
end


async(function()
	gui = GuiCreate()

	local x = 100
	local y = 100
	
	wait_seconds(1)

	gui_frame_fn = function()
		GuiLayoutBeginVertical( gui, 50, 20 )
		GuiOptionsAdd(gui, GUI_OPTION.Align_HorizontalCenter)
		GuiText(gui, 0,0, "Press your right mouse button." )
		GuiLayoutEnd( gui )
	end
	wait_seconds(2)
	---
	GuiDestroy( gui )
	gui_frame_fn = nil
	gui = nil
end)


async_loop(function()
	if gui ~= nil then
		GuiStartFrame( gui )
	end

	if gui_frame_fn ~= nil then
		gui_frame_fn()
	end

	wait(0)
end)