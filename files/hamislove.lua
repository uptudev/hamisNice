function add_tags()

	local xml2lua = dofile("mods/hamisNice/files/xml2lua_library/xml2lua.lua")
	local xml_content = ModTextFileGetContent("data/entities/animals/longleg.xml")
	local handler = xml2lua.parse(xml_content)
	if handler.root.Entity._attr.tags then
	  handler.root.Entity._attr.tags = handler.root.Entity._attr.tags .. ",hamis"
	else
	  handler.root.Entity._attr.tags = "hamis"
	end
	local xml_output = xml2lua.toXml(handler.root, "Entity", 0)
	ModTextFileSetContent("data/entities/animals/longleg.xml", xml_output)

end

add_tags()