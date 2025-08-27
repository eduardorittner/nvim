return {
  { -- Autoformat
    'stevearc/conform.nvim',
    opts = {
      notify_on_error = true,
      formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'black' },
        c = { 'clang-format' },
        rust = { 'rust_analyzer' },
      },

      -- Enables format on save for everything *except* filetypes declared in disable_filetypes
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        local disable_filetypes = { java = false }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
    },
  },
}
