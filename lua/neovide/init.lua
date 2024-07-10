-- neovide 配置
-- vim.g.neovide_cursor_vfx_mode = "railgun" -- 拖尾粒子 [电磁炮]
-- vim.g.neovide_cursor_vfx_mode = "pixiedust" -- 拖尾粒子 [仙尘]
-- vim.g.neovide_cursor_vfx_particle_density = 10.0 -- 粒子密度
-- vim.g.neovide_cursor_vfx_particle_speed = 1.0 -- 粒子速度
-- vim.o.guifont = "0xProto Nerd Font:h12:b" -- 设置字体
vim.o.guifont = "CaskaydiaCove Nerd Font:h14" -- 设置字体
vim.g.neovide_cursor_trail_size = 0.85 -- 光标轨迹长度
vim.g.neovide_cursor_animation_length = 0.025 -- 光标拖尾 [单位秒]
vim.g.neovide_transparency = 0.95 -- 窗口透明度
-- vim.g.neovide_fullscreen = true -- 全屏neovide
vim.g.neovide_hide_mouse_when_typing = true -- 设置打字自动隐藏鼠标
vim.g.neovide_refresh_rate = 170 -- 焦点帧数
vim.g.neovide_refresh_rate_idle = 5 -- 空闲帧数
vim.g.neovide_profiler = false -- 帧率显示

-- vim.g.neovide_cursor_vfx_mode = "sonicboom" -- 光标特效 音爆
-- vim.g.neovide_cursor_vfx_mode = "ripple" -- 光标特效 波纹
vim.g.neovide_cursor_vfx_mode = "wireframe" -- 光标特效 线框

-- 窗口边框间距
vim.g.neovide_padding_top = 0
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_rieht = 0
vim.g.neovide_padding_left = 0

-- 窗口阴影
vim.g.neovide_floating_shadow = false
vim.g.neovide_floating_z_height = 10
vim.g.neovide_light_angle_degrees = 45
vim.g.neovide_light_radius = 5
