require("dressing").setup {
  input = {
    enabled = true,
    default_prompt = "Input:",
    prompt_align = "left",
    insert_only = true,
    anchor = "SW",
    border = "rounded",
    relative = "cursor",

    prefer_width = 40,
    width = nil,
    max_width = { 140, 0.9 },
    min_width = { 20, 0.2 },

    winblend = 20,
    winhighlight = "",

    override = function(conf)
      return conf
    end,

    get_config = nil,
  },

  select = {
    backend = { "telescope", "nui", "fzf", "builtin" },

    nui = {
      position = {
        row = 1,
        col = 0,
      },
      size = nil,
      relative = "cursor",
      border = {
        style = "rounded",
        text = {
          top_align = "right",
        },
      },
      max_width = 80,
      max_height = 40,
    },

    -- see :help dressing_get_config
    get_config = function(opts)
      if opts.kind == "codeaction" then
        return {
          backend = "nui",
          nui = {
            relative = "cursor",
            max_width = 80,
          },
        }
      end
    end,
  },
}
