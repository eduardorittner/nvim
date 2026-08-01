-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects

local setup = function()
  -- Fix for Neovim 0.12 query directive node capture wrapping in nvim-treesitter
  local ts_query = require('vim.treesitter.query')
  local opts = { force = true, all = false }

  ts_query.add_directive('set-lang-from-info-string!', function(match, _, bufnr, pred, metadata)
    local capture_id = pred[2]
    local node = match[capture_id]
    if type(node) == 'table' and not node.range then
      node = node[1]
    end
    if not node then
      return
    end
    local text = vim.treesitter.get_node_text(node, bufnr)
    if text then
      local injection_alias = text:lower()
      local match_ft = vim.filetype.match { filename = 'a.' .. injection_alias }
      metadata['injection.language'] = match_ft or injection_alias
    end
  end, opts)

  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'bash', 'c', 'lua', 'rust', 'markdown', 'markdown_inline' },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  }
end

return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'master',
    build = ':TSUpdate',
    config = function()
      setup()
    end,
  },
}
