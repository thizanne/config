----------------------------------------
--                                    --
-- Awesome Theme for Thibault Suzanne --
--                                    -- 
----------------------------------------

-- BASICS
theme = {}
theme.font          = "sans 8"

theme.bg_focus      = "#ddfafe"
theme.bg_normal     = "#0e0043"
theme.bg_urgent     = "#4bb5c1"
theme.bg_minimize   = "#0e0043"

theme.fg_focus      = "#0e0043"
theme.fg_normal     = "#ffffff"
theme.fg_urgent     = "#0e0043"
theme.fg_minimize   = "#4bb5c1"

theme.border_width  = "2"
theme.border_normal = "#dae3e0"
theme.border_focus  = "#729fcf"
theme.border_marked = "#eeeeec"

-- IMAGES - from a default blue awesome theme
theme.layout_fairh           = "/home/thibault/.config/awesome/themes/suze/layouts/fairh.png"
theme.layout_fairv           = "/home/thibault/.config/awesome/themes/suze/layouts/fairv.png"
theme.layout_floating        = "/home/thibault/.config/awesome/themes/suze/layouts/floating.png"
theme.layout_magnifier       = "/home/thibault/.config/awesome/themes/suze/layouts/magnifier.png"
theme.layout_max             = "/home/thibault/.config/awesome/themes/suze/layouts/max.png"
theme.layout_fullscreen      = "/home/thibault/.config/awesome/themes/suze/layouts/fullscreen.png"
theme.layout_tilebottom      = "/home/thibault/.config/awesome/themes/suze/layouts/tilebottom.png"
theme.layout_tileleft        = "/home/thibault/.config/awesome/themes/suze/layouts/tileleft.png"
theme.layout_tile            = "/home/thibault/.config/awesome/themes/suze/layouts/tile.png"
theme.layout_tiletop         = "/home/thibault/.config/awesome/themes/suze/layouts/tiletop.png"
theme.layout_spiral          = "/home/thibault/.config/awesome/themes/suze/layouts/spiral.png"
theme.layout_dwindle         = "/home/thibault/.config/awesome/themes/suze/layouts/dwindle.png"

theme.awesome_icon           = "/home/thibault/.config/awesome/themes/suze/awesome-icon.png"
theme.tasklist_floating_icon = "/home/thibault/.config/awesome/themes/suze/layouts/floating.png"

-- from default for now...
theme.menu_submenu_icon     = "/usr/share/awesome/themes/default/submenu.png"
theme.taglist_squares_sel   = "/usr/share/awesome/themes/default/taglist/squarefw.png"
theme.taglist_squares_unsel = "/usr/share/awesome/themes/default/taglist/squarew.png"

-- MISC
theme.wallpaper_cmd = 
   { "awsetbg -a /home/thibault/.config/awesome/themes/suze/wallpapers/IleLouëtZoom.jpg" }
theme.taglist_squares       = "true"
theme.titlebar_close_button = "true"
theme.menu_height           = "15"
theme.menu_width            = "100"

-- Define the image to load
theme.titlebar_close_button_normal = 
   "/usr/share/awesome/themes/default/titlebar/close_normal.png"
theme.titlebar_close_button_focus = 
   "/usr/share/awesome/themes/default/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive =
   "/usr/share/awesome/themes/default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive =
   "/usr/share/awesome/themes/default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active =
   "/usr/share/awesome/themes/default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active =
   "/usr/share/awesome/themes/default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive =
   "/usr/share/awesome/themes/default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive =
   "/usr/share/awesome/themes/default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active =
   "/usr/share/awesome/themes/default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active =
   "/usr/share/awesome/themes/default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive =
   "/usr/share/awesome/themes/default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive =
   "/usr/share/awesome/themes/default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active =
   "/usr/share/awesome/themes/default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active =
   "/usr/share/awesome/themes/default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive =
   "/usr/share/awesome/themes/default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive =
   "/usr/share/awesome/themes/default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active =
   "/usr/share/awesome/themes/default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active =
   "/usr/share/awesome/themes/default/titlebar/maximized_focus_active.png"

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:encoding=utf-8:textwidth=80
