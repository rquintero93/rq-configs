local colors = require("colors")
local icons = require("icons")
--
-- Handles the small icon indicator for spaces / menus changes
local spaces_indicator = sbar.add("item", {
	padding_left = -3,
	padding_right = 5,
	icon = {
		padding_left = 8,
		padding_right = 9,
		color = colors.black,
		string = icons.switch.on,
	},
	label = {
		width = 0,
		padding_left = 0,
		padding_right = 8,
		string = "Spaces",
		color = colors.bg1,
	},
	background = {
		color = colors.with_alpha(colors.black, 0.0),
		border_color = colors.with_alpha(colors.bg1, 0.0),
	},
})

spaces_indicator:subscribe("swap_menus_and_spaces", function(env)
	local currently_on = spaces_indicator:query().icon.value == icons.switch.on
	spaces_indicator:set({
		icon = currently_on and icons.switch.off or icons.switch.on,
	})
end)

spaces_indicator:subscribe("mouse.entered", function(env)
	sbar.animate("tanh", 30, function()
		spaces_indicator:set({
			background = {
				color = {
					alpha = 1.0,
				},
				border_color = {
					alpha = 1.0,
				},
			},
			icon = {
				color = colors.white,
			},
			label = {
				width = "dynamic",
				color = colors.white,
			},
		})
	end)
end)

spaces_indicator:subscribe("mouse.exited", function(env)
	sbar.animate("tanh", 30, function()
		spaces_indicator:set({
			background = {
				color = {
					alpha = 0.0,
				},
				border_color = {
					alpha = 0.0,
				},
			},
			icon = {
				color = colors.black,
			},
			label = {
				width = 0,
			},
		})
	end)
end)

spaces_indicator:subscribe("mouse.clicked", function(env)
	sbar.trigger("swap_menus_and_spaces")
end)
