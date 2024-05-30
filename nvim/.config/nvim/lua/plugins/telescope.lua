---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local open_with_trouble = function(...) return require("trouble.providers.telescope").open_with_trouble(...) end
    local open_selected_with_trouble = function(...)
      return require("trouble.providers.telescope").open_selected_with_trouble(...)
    end
    return require("astrocore").extend_tbl(opts, {
      defaults = {
        mappings = {
          i = { ["<c-t>"] = open_with_trouble },
          n = { ["<c-t>"] = open_selected_with_trouble },
        },
      },
    })
  end,
}
