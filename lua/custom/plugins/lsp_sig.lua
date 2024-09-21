return {
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    config = function()
      require 'custom.configs.lsp_sig'
    end,
    enabled = false,
  },
}
