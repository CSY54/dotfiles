-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "███    ███ ███████  ██████  ██     ██",
        "████  ████ ██      ██    ██ ██     ██",
        "██ ████ ██ █████   ██    ██ ██  █  ██",
        "██  ██  ██ ██      ██    ██ ██ ███ ██",
        "██      ██ ███████  ██████   ███ ███ ",
      }
      return opts
    end,
  },

  {
    "sQVe/sort.nvim",
    opts = function() require("sort").setup() end,
  },
}
