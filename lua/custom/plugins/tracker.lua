return {
  dir = '/home/erittner/coding/lua/activity_tracker/',
  dev = {
    path = '~/coding/lua',
  },
  name = 'activity_tracker',
  lazy = false,
  enabled = false,

  config = function()
    local tracker = require 'config.activity_tracker'
    -- tracker:setup()
  end,
}
