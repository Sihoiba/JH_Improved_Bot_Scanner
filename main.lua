register_blueprint "perk_hb_botscanner"
{
	blueprint = "perk",
	lists = {
		group    = "perk_cb",
		keywords = { "visor", "cvisor", "headset" },
	},
	text = {
		name = "Bot scanner",
		desc = "reveals turrets and bots on the minimap",
	},
	callbacks = {
		on_action = [[
			function ( self, entity, time_passed, last )
				if entity then
					local l   = world:get_level()
					for e in l:beings() do 
						if e.data and e.data.is_mechanical then
							local btracker = e:equip("bot_tracker")
							e.minimap.color = btracker.minimap.color
							e.minimap.always = true
						end
					end
				end
				return 0
			end
		]],
	},
}

register_blueprint "bot_tracker"
{
    flags = { EF_NOPICKUP, },
    minimap = {
        color    = tcolor( LIGHTGRAY, ivec3( 75, 75, 75 ) ),
        priority = 110,
    },
}