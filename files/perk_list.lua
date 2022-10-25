table.insert(perk_list,
  {
    id = "hamis_nice",
    ui_name = "Hämis",
    ui_description = "THE GODS SAY 'NICE'.",
    ui_icon = "data/ui_gfx/perk_icons/hamis_nice.png",  -- Change this to your own
    perk_icon = "data/items_gfx/perks/hamis_nice.png",  -- Change this to your own
    stackable = STACKABLE_NO,
    usable_by_enemies = false,
    not_in_default_perk_pool = false, --set to true to not include it in the default perk pool
    func = function( entity_perk_item, entity_who_picked, item_name, pickup_count )
      EntityAddComponent( entity_who_picked, "LuaComponent", 
      {
        _tags = "perk_component",
        script_source_file = "data/scripts/perks/hamisinputhandler.lua",
        execute_every_n_frame = "6",
      } )
    end
  }
)