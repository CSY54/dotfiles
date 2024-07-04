---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    require("astrocore").extend_tbl(opts, {
      close_if_last_window = false,
      window = {
        mappings = {
          ["S"] = "split_with_window_picker",
          ["s"] = "vsplit_with_window_picker",
        },
      },
    })
  end,
}
