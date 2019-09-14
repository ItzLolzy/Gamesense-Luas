local w,h = client.screen_size()
local hw = w/2
local ui_set_visible = ui.set_visible
local ui_get = ui.get
local ui_set = ui.set
local renderer_text = renderer.text
local client_set_event_callback = client.set_event_callback
local skeetSlide = ui.reference("MISC", "Miscellaneous", "Clan tag spammer")
local skeetUnload = ui.reference("MISC", "Other", "Unload")
local newTag = ui.new_checkbox("MISC", "Miscellaneous", "Skeet clan tag")
local stepw = 2
local amountPressed = 0

local function onPaint()
	ui_set_visible(newTag, false)
	if stepw > w  then
		stepw = 1
		ui_set(newTag, false)
	end

	if ui_get(skeetSlide, true) then
		amountPressed = amountPressed + 1
		ui_set(newTag, true)
		ui_set(skeetSlide, false)
	end
	
	if ui_get(newTag, true) then
		stepw = stepw + stepw/100
		renderer_text(hw + stepw, h/5, 255, 0, 0, 255, "+cb", 0, "NO!")
	end

	if amountPressed == 3 then
		ui_set(skeetUnload, true)
	end
end
client_set_event_callback("paint", onPaint)