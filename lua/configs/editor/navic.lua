return {
  init = function()
    vim.g.navic_silence = true
    local icon = "󰈚"
    local path = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0))
    local name = (path == "" and "Empty") or path:match "([^/\\]+)[/\\]*$"

    if name ~= "Empty" then
      local devicons_present, devicons = pcall(require, "nvim-web-devicons")

      if devicons_present then
        local ft_icon = devicons.get_icon(name)
        icon = (ft_icon ~= nil and ft_icon) or icon
      end
    end

    local function should_show_navic(buf)
      local ft = vim.bo[buf].filetype
      local bt = vim.bo[buf].buftype

      local exclude_ft = {
        "neo-tree",
        "NvimTree",
        "fzf",
        "toggleterm",
        "help",
        "gitcommit",
        "alpha",
      }

      local exclude_bt = {
        "terminal",
        "nofile",
        "prompt",
      }

      return not vim.tbl_contains(exclude_ft, ft) and not vim.tbl_contains(exclude_bt, bt)
    end

    LazyVim.lsp.on_attach(function(client, buffer)
      if client:supports_method "textDocument/documentSymbol" then
        if should_show_navic(buffer) then
          require("nvim-navic").attach(client, buffer)
          vim.api.nvim_set_option_value(
            "winbar",
            vim.trim(icon .. " " .. name .. "  " .. "%{%v:lua.require'nvim-navic'.get_location()%}"),
            { scope = "local", win = 0 }
          )
        else
          vim.api.nvim_set_option_value("winbar", nil, { scope = "local", win = 0 })
        end
      end
    end)
  end,
  opts = function()
    return {
      separator = "  ",
      highlight = true,
      depth_limit = 5,
      icons = require("configs.icons").icons_vscode,
      lazy_update_context = true,
    }
  end,
}
