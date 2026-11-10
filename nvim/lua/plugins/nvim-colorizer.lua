return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		user_default_options = {
			names = false, -- don't color words like "red" or "blue"
			RGB = true, -- #fff
			RRGGBB = true, -- #ffffff
			RRGGBBAA = true, -- #ffffff80
			rgb_fn = true, -- rgb(255, 0, 0)
			hsl_fn = true, -- hsl(0, 100%, 50%)
			css = true, -- enable all CSS features
			tailwind = false, -- set true if you use Tailwind classes
			mode = "background", -- "background", "foreground" or "virtualtext"
		},
	},
}
