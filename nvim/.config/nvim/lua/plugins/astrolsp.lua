---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      autoformat = true,
      codelens = true,
      inlay_hints = true,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        "tsserver",
        "json",
      },
    },
    ---@diagnostic disable: missing-fields
    config = {
      clangd = { cmd = { "clangd", "--enable-config" }, capabilities = { offsetEncoding = "utf-16" } },
      basedpyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
        capabilities = {
          workspace = {
            didChangeWatchedFiles = {
              dynamicRegistration = true,
            },
          },
        },
      },
      terraformls = {
        filetypes = { "terraform", "terraform-vars", "tf" },
      },
      tsserver = {
        settings = {
          javascript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = false,
            },
          },
          typescript = {
            inlayHints = {
              includeInlayEnumMemberValueHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayVariableTypeHints = false,
            },
          },
          implicitProjectConfiguration = {
            checkJs = true,
          },
        },
      },
      yamlls = {
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
      },
    },
    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },
    mappings = {
      n = {
        ["gs"] = { function() vim.lsp.buf.signature_help() end, desc = "Show signature help" },
      },
    },
    handlers = {
      yamlls = false,
    },
  },
}
