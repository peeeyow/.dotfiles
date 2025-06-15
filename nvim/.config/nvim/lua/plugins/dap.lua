local prefix = "<Leader>d"

---@type LazySpec
return {
  {
    "mfussenegger/nvim-dap",
    config = function() require("dap.ext.vscode").load_launchjs() end,
  },
  {
    "rcarriga/nvim-dap-ui",
    keys = {
      {
        prefix .. "U",
        function() require("dapui").open { reset = true } end,
        desc = "Reset dap UI",
      },
      {
        prefix .. "f",
        function() require("dap-python").test_method() end,
        desc = "Test method",
      },
      {
        prefix .. "x",
        function() require("dap-python").test_class() end,
        desc = "Test Class",
      },
      {
        prefix .. "s",
        function() require("dap-python").debug_selection() end,
        desc = "Debug selection",
        mode = "v",
      },
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    ft = "python",
    keys = {
      {
        prefix .. "e",
        function() require("dap").set_exception_breakpoints { "raised", "uncaught" } end,
        desc = "Add post mortem debugging",
      },
    },
    config = function(_, opts)
      local path = vim.fn.expand "$MASON/packages/debugpy" .. "/venv/bin/python"
      require("dap-python").setup(path, opts)

      table.insert(require("dap").configurations.python, {
        type = "python",
        request = "launch",
        name = "Django",
        program = vim.fn.getcwd() .. "/manage.py",
        args = { "runserver", "--noreload" },
        django = true,
      })
    end,
  },
}
