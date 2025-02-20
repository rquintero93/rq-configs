local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")

local spaces = {}

local workspaces = get_workspaces()
local current_workspace = get_current_workspace()

local function split(str, sep)
	local result = {}
	local regex = ("([^%s]+)"):format(sep)
	for each in str:gmatch(regex) do
		table.insert(result, each)
	end
	return result
end

for i, workspace in ipairs(workspaces) do
	local selected = workspace == current_workspace
	local space = sbar.add("item", "item." .. i, {
		icon = {
			font = {
				family = settings.font.numbers,
			},
			string = i,
			padding_left = settings.items.padding.left,
			padding_right = settings.items.padding.left / 2,
			-- color = settings.items.default_color(i),
			highlight_color = settings.items.default_color(i),
			highlight = selected,
		},
		label = {
			padding_right = settings.items.padding.right,
			-- color = settings.items.default_color(i),
			highlight_color = settings.items.default_color(i),
			font = settings.icons,
			y_offset = -1,
			highlight = selected,
		},
		padding_right = 1,
		padding_left = 1,
		background = {
			color = settings.items.colors.background,
			border_width = 1,
			height = settings.items.height,
			-- border_color = selected and settings.items.highlight_color(i) or settings.items.default_color(i),
		},
		popup = {
			background = {
				border_width = 5,
				border_color = colors.black,
			},
		},
	})

	spaces[i] = space

	-- Define the icons for open apps on each space initially
	sbar.exec("aerospace list-windows --workspace " .. i .. " --format '%{app-name}' --json ", function(apps)
		local icon_line = ""
		local no_app = true
		for y, app in ipairs(apps) do
			no_app = false
			local app_name = app["app-name"]
			local lookup = app_icons[app_name]
			local icon = ((lookup == nil) and app_icons["default"] or lookup)
			icon_line = icon_line .. " " .. icon
		end

		if no_app then
			icon_line = ""
		end

		sbar.animate("tanh", 10, function()
			space:set({
				label = icon_line,
			})
		end)
	end)

	-- Padding space between each item
	sbar.add("item", "item." .. i .. "padding", {
		script = "",
		width = settings.items.gap,
	})

	-- Item popup
	local space_popup = sbar.add("item", {
		position = "popup." .. space.name,
		padding_left = 5,
		padding_right = 0,
		background = {
			drawing = true,
			image = {
				corner_radius = 9,
				scale = 0.2,
			},
		},
	})

	space:subscribe("mouse.clicked", function(env)
		local SID = split(env.NAME, ".")[2]
		if env.BUTTON == "other" then
			space_popup:set({
				background = {
					image = "item." .. SID,
				},
			})
			space:set({
				popup = {
					drawing = "toggle",
				},
			})
		else
			sbar.exec("aerospace workspace " .. SID)
		end
	end)

	space:subscribe("mouse.exited", function(_)
		space:set({
			popup = {
				drawing = false,
			},
		})
	end)

	space:subscribe("aerospace_workspace_change", function(env)
		print(workspace, env.FOCUSED_WORKSPACE)
		if workspace == env.FOCUSED_WORKSPACE then
			space:set({
				icon = {
					highlight = true,
				},
				label = {
					highlight = true,
				},
			})
		else
			space:set({
				icon = {
					highlight = false,
				},
				label = {
					highlight = false,
				},
			})
		end
	end)

	local space_window_observer = sbar.add("item", {
		drawing = false,
		updates = true,
	})

	-- Event handles
	space_window_observer:subscribe("space_windows_change", function(env)
		sbar.exec("aerospace list-windows --workspace " .. i .. " --format '%{app-name}' --json ", function(apps)
			local icon_line = ""
			local no_app = true
			for z, app in ipairs(apps) do
				no_app = false
				local app_name = app["app-name"]
				local lookup = app_icons[app_name]
				local icon = ((lookup == nil) and app_icons["default"] or lookup)
				icon_line = icon_line .. " " .. icon
			end

			if no_app then
				icon_line = ""
			end

			sbar.animate("tanh", 10, function()
				spaces[i]:set({
					label = { string = icon_line },
				})
			end)
		end)
	end)
end
