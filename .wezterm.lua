local wezterm = require 'wezterm'

-- 创建一个配置对象
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- ==================== 窗口外观 ====================
-- 去掉系统标题栏，仅保留调整大小的边框
config.window_decorations = "RESIZE"

-- ==================== 终端核心 ====================
-- 使用指定的 Windows PowerShell 7 作为默认 shell
-- config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
-- config.default_prog = {'wsl.exe', '-d', 'Ubuntu-22.04'}
-- config.default_prog = {'wsl.exe', '-d', 'Ubuntu-22.04', '~'}
config.default_prog = {'wsl.exe', '-d', 'Ubuntu-22.04', '--cd', '/home/ly'}

-- ==================== 字体与光标 ====================
-- 设置字体为 DejaVu Sans Mono，字号 14
-- config.font = wezterm.font("DejaVu Sans Mono")
config.font = wezterm.font("SourceDejaVu")
config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}
config.font_size = 14.0

-- 设置光标形状为稳定的方块 (不闪烁)
config.default_cursor_style = "SteadyBlock"
-- config.use_fancy_tab_bar = true
-- config.hide_tab_bar_if_only_one_tab = true

-- ==================== 颜色与主题 ====================
-- 设置主题为 Edge Dark (如果您用的是亮色，可以改为 'Edge Light (base16)')
config.color_scheme = 'Apprentice (Gogh)'
-- config.color_scheme = 'Everforest Light (Gogh)'

-- 自定义光标颜色为 #FF80FF
config.colors = {
  cursor_bg = "#FF80FF",
  cursor_fg = "black",     -- 光标所在处的文字颜色，设置为黑色以保证对比度
  cursor_border = "#FF80FF", -- 光标边框颜色保持一致
}

-- 返回配置
return config
