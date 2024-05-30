local function on_file_remove(args)
  local ts_clients = vim.lsp.get_active_clients { name = "tsserver" }
  for _, ts_client in ipairs(ts_clients) do
    ts_client.request("workspace/executeCommand", {
      command = "_typescript.applyRenameFile",
      arguments = {
        {
          sourceUri = vim.uri_from_fname(args.source),
          targetUri = vim.uri_from_fname(args.destination),
        },
      },
    })
  end
end

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    local events = require "neo-tree.events"
    return require("astronvim.utils").extend_tbl(opts, {
      window = {
        mappings = {
          ["<C-v>"] = "open_vsplit",
          ["<C-x>"] = "open_split",
        },
      },
      event_handlers = {
        {
          event = events.FILE_MOVED,
          handler = on_file_remove,
        },
        {
          event = events.FILE_RENAMED,
          handler = on_file_remove,
        },
      },
    })
  end,
}
