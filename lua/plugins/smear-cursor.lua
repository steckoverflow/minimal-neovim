return {
	"sphamba/smear-cursor.nvim",
	event = "VeryLazy",
	opts = {
		-- Cursor color. Defaults to Cursor GUI color if not set.
		-- Set to "none" to match the character color at cursors position.
		cursor_color = "#d3cdc3",

		-- Smear cursor when switching buffers or windows.
		smear_between_buffers = true,

		-- Smear cursor when moving within line or to neighbor lines.
		smear_between_neighbor_lines = true,

		-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
		-- Smears will blend better on all backgrounds.
		legacy_computing_symbols_support = false,

		-- How fast the smear's head moves towards the target.
		-- 0: no movement, 1: instantaneous
		stiffness = 0.6,

		-- How fast the smear's tail moves towards the head.
		-- 0: no movement, 1: instantaneous
		trailing_stiffness = 0.3,

		-- Controls how fast the smear's tail decays/expires.
		-- 0: no decay, 1: instantaneous
		trailing_exponent = 0.1,

		-- Minimum distance for smear to occur.
		-- Default: 0 (pixels)
		distance_stop_animating = 0.1,

		-- Whether to hide the real cursor when smearing.
		hide_target_hack = true,
	},
}
