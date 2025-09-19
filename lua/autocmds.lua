require "nvchad.autocmds"

local colors = require("base46").get_theme_tb "base_16"

local navic_colors = {
  NavicIconsFile = colors.base05,
  NavicIconsModule = colors.base0C,
  NavicIconsNamespace = colors.base08,
  NavicIconsPackage = colors.base09,
  NavicIconsClass = colors.base0A,
  NavicIconsMethod = colors.base0E,
  NavicIconsProperty = colors.base0B,
  NavicIconsField = colors.base0B,
  NavicIconsConstructor = colors.base0D,
  NavicIconsEnum = colors.base0B,
  NavicIconsInterface = colors.base0E,
  NavicIconsFunction = colors.base0D,
  NavicIconsVariable = colors.base08,
  NavicIconsConstant = colors.base09,
  NavicIconsString = colors.base0A,
  NavicIconsNumber = colors.base09,
  NavicIconsBoolean = colors.base09,
  NavicIconsArray = colors.base0C,
  NavicIconsObject = colors.base0A,
  NavicIconsKey = colors.base08,
  NavicIconsNull = colors.base03,
  NavicIconsEnumMember = colors.base0B,
  NavicIconsStruct = colors.base0C,
  NavicIconsEvent = colors.base0A,
  NavicIconsOperator = colors.base0B,
  NavicIconsTypeParameter = colors.base0E,
  NavicText = colors.base05,
  NavicSeparator = colors.base04,
}

for name, fg in pairs(navic_colors) do
  vim.api.nvim_set_hl(0, name, { default = true, bg = colors.base00, fg = fg })
end
