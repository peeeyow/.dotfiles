local status_ok, noice = pcall(require, "noice")
if not status_ok then
  return
end

noice.setup {
  notify = {
    enabled = true,
  },
  messages = {
    enabled = false,
  },
  lsp_progress = {
    enabled = false,
  },
  views = {
    cmdline_popup = {
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 8,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
}
