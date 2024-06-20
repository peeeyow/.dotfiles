---@type LazySpec
return {
  {
    "danymat/neogen",
    opts = {
      languages = {
        python = {
          template = {
            annotation_convention = "numpydoc",
          },
        },
        lua = {
          template = {
            annotation_convention = "emmylua",
          },
        },
      },
    },
  },
}
