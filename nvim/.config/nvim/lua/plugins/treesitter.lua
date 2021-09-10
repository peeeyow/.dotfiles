local present, ts_config = pcall(require, "nvim-treesitter.configs")
if not present then
    return 
end

ts_config.setup {
    ensure_installed = { "bash", "lua", "python", "c" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        use_languagetree = true
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_hl_groups = 'i',
            toggle_query_editor = 'o',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {}, -- table of hex strings
        termcolors = {} -- table of colour name strings
      }
}
