return {
  -- Highly experimental plugin that completely replaces the UI for messages, cmdline and the popupmenu.
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = require("configs.ui.noice").opts,
    config = require("configs.ui.noice").config,
    kesy = require("configs.ui.noice").keys,
  },

  -- icons
  {
    "nvim-mini/mini.icons",
    lazy = true,
    init = require("configs.ui.mini-icons").init,
    opts = require("configs.ui.mini-icons").opts,
  },

  -- ui components
  { "MunifTanjim/nui.nvim", lazy = true },

  {
    "nvim-mini/mini.indentscope",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VeryLazy",
    init = require("configs.ui.mini-indentscope").init,
    opts = require("configs.ui.mini-indentscope").opts,
  },

  -- disable inent-blankline scope when mini-indentscope is enabled
  {
    "lukas-reineke/indent-blankline.nvim",
    optional = true,
    opts = {
      scope = { enabled = false },
    },
  },
}
