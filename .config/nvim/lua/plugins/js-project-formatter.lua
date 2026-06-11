local PRETTIER_CONFIG_FILES = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.yml",
  ".prettierrc.yaml",
  ".prettierrc.json5",
  ".prettierrc.js",
  "prettier.config.js",
  ".prettierrc.ts",
  "prettier.config.ts",
  ".prettierrc.mjs",
  "prettier.config.mjs",
  ".prettierrc.mts",
  "prettier.config.mts",
  ".prettierrc.cjs",
  "prettier.config.cjs",
  ".prettierrc.cts",
  "prettier.config.cts",
  ".prettierrc.toml",
}

local BIOME_CONFIG_FILES = {
  "biome.json",
  "biome.jsonc",
  ".biome.json",
  ".biome.jsonc",
}

local OXFMT_CONFIG_FILES = {
  ".oxfmtrc.json",
  ".oxfmtrc.jsonc",
  "oxfmt.config.ts",
}

-- TODO: only checked for config file presense, but prettier allow config in package.json as well
local has_prettier_config = function(utils) return utils.root_has_file(PRETTIER_CONFIG_FILES) end
local has_biome_config = function(utils) return utils.root_has_file(BIOME_CONFIG_FILES) end
local has_oxfmt_config = function(utils) return utils.root_has_file(OXFMT_CONFIG_FILES) end

-- we configure formatters for js/ts projects
-- if either prettier, biome or oxfmt config file is found, we will use the corresponding formatter
-- otherwise, we will use oxfmt as the default formatter with a custom config
---@type LazySpec
return {
  {
    "jay-babu/mason-null-ls.nvim",
    opts = {
      handlers = {
        -- for prettierd
        prettierd = function()
          require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
            condition = function(utils) return has_prettier_config(utils) end,
          })
        end,

        -- for biome
        biome = function()
          require("null-ls").register(require("null-ls").builtins.formatting.biome.with {
            condition = function(utils) return has_biome_config(utils) end,
          })
        end,

        -- for oxfmt
        oxfmt = function()
          require("null-ls").register(require("none-ls.formatting.oxfmt").with {
            prepend_extra_args = true,
            extra_args = function()
              local utils = require("null-ls.utils").make_conditional_utils()
              if has_oxfmt_config(utils) then
                return {}
              else
                return { "-c", vim.fn.stdpath "config" .. "/extras/oxfmtrc.json" }
              end
            end,

            condition = function(utils)
              return has_oxfmt_config(utils) or (not has_prettier_config(utils) and not has_biome_config(utils))
            end,
          })
        end,
      },
    },
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = function(_, opts)
      opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
        "oxfmt",
      })
    end,
  },
}
