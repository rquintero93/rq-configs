return {
	black = 0xff181819,
	white = 0xffe2e2e3,
	red = 0xfffc5d7c,
	green = 0xff9ed072,
	blue = 0xff76cce0,
	yellow = 0xffe7c664,
	orange = 0xfff39660,
	magenta = 0xffcba6f7,
	grey = 0xff7f8490,
	transparent = 0x00000000,

	bar = {
		bg = 0x002c2e34,
		border = 0xff2c2e34,
	},
	popup = {
		bg = 0xc02c2e34,
		border = 0xff7f8490,
	},
	bg1 = 0xff181819,
	bg2 = 0xff414550,

	rainbow = {
		0xff7f8490, -- Maroon
		0xffb4befe, -- Lavender
		0xff89b4fa, -- Blue
		0xffa6e3a1, -- Green
		0xffcba6f7, -- Mauve
		0xff74c7ec, -- Sapphire
		0xff89dceb, -- Sky
		0xfffab387, -- Peach
	},

	with_alpha = function(color, alpha)
		if alpha > 1.0 or alpha < 0.0 then
			return color
		end
		return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
	end,
}
