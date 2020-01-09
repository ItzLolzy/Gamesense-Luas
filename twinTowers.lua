local get_local_player = entity.get_local_player
local entity_get_prop = entity.get_prop
local client_set_clan_tag = client.set_clan_tag
local oldTick = globals.tickcount()
local TwinTower_enabled = ui.new_checkbox("MISC", "Miscellaneous", "Twin Towers Clantag")
local TwinTowerClantag = {"\xE2\x9C\x88__\xE2\x96\x8C\xE2\x96\x8C", "_\xE2\x9C\x88_\xE2\x96\x8C\xE2\x96\x8C", "__\xE2\x9C\x88\xE2\x96\x8C\xE2\x96\x8C", "___\xE2\x98\xA0\xE2\x9C\x88\xE2\x96\x8C", "___\xE2\x98\xA0_\xE2\x98\xA0"," "} 
local cur = 1

local function get_twint(e)
    if (ui.get(TwinTower_enabled)) then
        if globals.tickcount() - oldTick > 55 then
            cur = math.floor(globals.curtime() % 6 + 1)
            client_set_clan_tag(TwinTowerClantag[cur])
            oldTick = globals.tickcount()
        end
    end
end
client.set_event_callback("player_connect_full", function(e)
    oldTick = globals.tickcount()
end)
client.set_event_callback("paint", get_twint)