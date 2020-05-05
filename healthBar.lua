local entity_get_players = entity.get_players
local renderer_world_to_screen = renderer.world_to_screen
local entity_get_prop = entity.get_prop
local math_floor = math.floor

local checkbox = ui.new_checkbox("Visuals", "Player ESP", "Healthbar")
local colourPicker = ui.new_color_picker("Visuals", "Player ESP", "Healthbar", 201,6,201,255)
local checkbox1 = ui.new_checkbox("Visuals", "Player ESP", "Healthbar HP")

local function on_paint()
    if ui.get(checkbox) == true then
        local enemies = entity_get_players(true)
        local r,g,b,a = ui.get(colourPicker)

        for i = 1, #enemies do
            local entindex = enemies[i]
            local box_enemy_xb, box_enemy_yb, box_enemy_x2b, box_enemy_y2b, box_enemy_ab = entity.get_bounding_box(entindex)
            local health = entity_get_prop(entindex, "m_iHealth")

            if box_enemy_xb == nil then box_enemy_xb=0 box_enemy_yb=0 box_enemy_x2b=0 box_enemy_y2b=0 end
            
            local h1 = box_enemy_y2b-box_enemy_yb
            renderer.rectangle(box_enemy_xb-6, box_enemy_yb-1, 4, h1, 0, 0, 0, 255)

            renderer.rectangle(box_enemy_xb-5, box_enemy_yb+h1, 2, (box_enemy_y2b-box_enemy_yb)-((((box_enemy_y2b-box_enemy_yb)*health)/100))-h1, r,g,b,a)
            
            if ui.get(checkbox1) then
                renderer.text(box_enemy_xb-22, box_enemy_y2b+(box_enemy_y2b-box_enemy_yb)-((((box_enemy_y2b-box_enemy_yb)*health)/100))-h1, 255,255,255,255, "c", 100, health .. "hp")
            end

        end
    end
end
client.set_event_callback("paint", on_paint)