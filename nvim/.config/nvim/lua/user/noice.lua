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
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
}
