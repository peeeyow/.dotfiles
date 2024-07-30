---@type LazySpec
return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.tex_flavor = "latex"
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.tex_conceal = "abdmg"

    vim.api.nvim_create_autocmd("FileType", {
      desc = "Set up VimTex Which-Key descriptions",
      group = vim.api.nvim_create_augroup("vimtex_mapping_descriptions", { clear = true }),
      pattern = "tex",
      callback = function()
        local wk = require "which-key"
        local prefix_vimtex_commands = "<localleader>l"
        local vimtex_command_mappings = {
          { prefix_vimtex_commands, group = "+VimTeX" },
          { prefix_vimtex_commands .. "a", desc = "Show Context Menu" },
          { prefix_vimtex_commands .. "C", desc = "Full Clean" },
          { prefix_vimtex_commands .. "c", desc = "Clean" },
          { prefix_vimtex_commands .. "e", desc = "Show Errors" },
          { prefix_vimtex_commands .. "G", desc = "Show Status for All" },
          { prefix_vimtex_commands .. "g", desc = "Show Status" },
          { prefix_vimtex_commands .. "i", desc = "Show Info" },
          { prefix_vimtex_commands .. "I", desc = "Show Full Info" },
          { prefix_vimtex_commands .. "k", desc = "Stop VimTeX" },
          { prefix_vimtex_commands .. "K", desc = "Stop All VimTeX" },
          { prefix_vimtex_commands .. "L", desc = "Compile Selection" },
          { prefix_vimtex_commands .. "l", desc = "Compile" },
          { prefix_vimtex_commands .. "m", desc = "Show Imaps" },
          { prefix_vimtex_commands .. "o", desc = "Show Compiler Output" },
          { prefix_vimtex_commands .. "q", desc = "Show VimTeX Log" },
          { prefix_vimtex_commands .. "s", desc = "Toggle Main" },
          { prefix_vimtex_commands .. "t", desc = "Open Table of Contents" },
          { prefix_vimtex_commands .. "T", desc = "Toggle Table of Contents" },
          { prefix_vimtex_commands .. "v", desc = "View Compiled Document" },
          { prefix_vimtex_commands .. "X", desc = "Reload VimTeX State" },
          { prefix_vimtex_commands .. "x", desc = "Reload VimTeX" },
        }
        local prefix_vimtex_cycles = "ts"
        local vimtex_cycle_mappings = {
          { prefix_vimtex_cycles, group = "VimTeX Toggles & Cycles" },
          { prefix_vimtex_cycles .. "$", desc = "Cycle inline, display & numbered equation" },
          { prefix_vimtex_cycles .. "c", desc = "Toggle star of command" },
          { prefix_vimtex_cycles .. "d", desc = "Cycle (), \\left(\\right) [,...]" },
          { prefix_vimtex_cycles .. "D", desc = "Reverse Cycle (), \\left(\\right) [, ...]" },
          { prefix_vimtex_cycles .. "e", desc = "Toggle star of environment" },
          { prefix_vimtex_cycles .. "f", desc = "Toggle a/b vs \\frac{a}{b}" },
        }
        local vimtex_movement_mappings = {
          { "[/", desc = "Previous start of a LaTeX comment" },
          { "[*", desc = "Previous end of a LaTeX comment" },
          { "[[", desc = "Previous beginning of a section" },
          { "[]", desc = "Previous end of a section" },
          { "[m", desc = "Previous \\begin" },
          { "[M", desc = "Previous \\end" },
          { "[n", desc = "Previous start of a math zone" },
          { "[N", desc = "Previous end of a math zone" },
          { "[r", desc = "Previous \\begin{frame}" },
          { "[R", desc = "Previous \\end{frame}" },
          { "]/", desc = "Next start of a LaTeX comment %" },
          { "]*", desc = "Next end of a LaTeX comment %" },
          { "][", desc = "Next beginning of a section" },
          { "]]", desc = "Next end of a section" },
          { "]m", desc = "Next \\begin" },
          { "]M", desc = "Next \\end" },
          { "]n", desc = "Next start of a math zone" },
          { "]N", desc = "Next end of a math zone" },
          { "]r", desc = "Next \\begin{frame}" },
          { "]R", desc = "Next \\end{frame}" },
        }
        local vimtex_ts_object_mappings = {
          { "csc", desc = "Change surrounding command" },
          { "cse", desc = "Change surrounding environment" },
          { "cs$", desc = "Change surrounding math zone" },
          { "csd", desc = "Change surrounding delimiter" },
          { "dsc", desc = "Delete surrounding command" },
          { "dse", desc = "Delete surrounding environment" },
          { "ds$", desc = "Delete surrounding math zone" },
          { "dsd", desc = "Delete surrounding delimiter" },
        }
        local vimtex_op_mode_mappings = {
          { "ic", mode = "o", desc = "LaTeX Command" },
          { "ac", mode = "o", desc = "LaTeX Command" },
          { "id", mode = "o", desc = "LaTeX Math Delimiter" },
          { "ad", mode = "o", desc = "LaTeX Math Delimiter" },
          { "ie", mode = "o", desc = "LaTeX Environment" },
          { "ae", mode = "o", desc = "LaTeX Environment" },
          { "i$", mode = "o", desc = "LaTeX Math Zone" },
          { "a$", mode = "o", desc = "LaTeX Math Zone" },
          { "iP", mode = "o", desc = "LaTeX Section, Paragraph, ..." },
          { "aP", mode = "o", desc = "LaTeX Section, Paragraph, ..." },
          { "im", mode = "o", desc = "LaTeX Item" },
          { "am", mode = "o", desc = "LaTeX Item" },
        }
        wk.add(vimtex_command_mappings)
        wk.add(vimtex_cycle_mappings)
        wk.add(vimtex_movement_mappings)
        wk.add(vimtex_ts_object_mappings)
        wk.add(vimtex_op_mode_mappings)
      end,
    })
  end,
}
