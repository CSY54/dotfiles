-- Customize Treesitter

---@type LazySpec
return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		ensure_installed = {
			-- defualt
			"lua",
			"vim",

			-- added
			"asm",
			"astro",
			"bash",
			"c",
			"comment",
			"cpp",
			"css",
			-- "cuda",
			"diff",
			-- "disassembly",
			"dockerfile",
			-- "elixir",
			-- "go",
			"html",
			"javascript",
			"json",
			"jsonc",
			"lua",
			"make",
			"markdown",
			-- "php",
			-- "prisma",
			"python",
			"regex",
			-- "rust",
			"scss",
			-- "solidity",
			-- "sql",
			-- "svelte",
			"toml",
			"typescript",
			"vue",
			-- "zig",
		},
	},
}
