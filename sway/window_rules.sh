# WINDOW RULES
  # Open audio control on cursor
 
for_window {
  [shell="xwayland"] title_format "%title [XWayland]"
  [app_id="firefox"] inhibit_idle fullscreen
  [app_id="mpv"] inhibit_idle fullscreen  
  [app_id="Vivaldi-stable"] inhibit_idle fullscreen
  [app_id="ulauncher"] floating enable, border none
  [window_role="pop-up"] floating enable
  [window_role="bubble"] floating enable
  [window_role="dialog"] floating enable
  [window_type="dialog"] floating enable

  [app_id="org.gnome.Nautilus"] floating enable
  [app_id="pavucontrol"] floating enable, resize set width 500px height 500px, move position cursor, move down 30px
  [app_id="(?i)mpv"] floating enable

  [title="(?:Open|Save) (?:File|Folder|As)"] floating enable, resize set width 1030 height 710

  # terminal
  [app_id=$term_id] move to scratchpad, scratchpad show, $t_pos
  [app_id=$other_term_id] move to scratchpad, scratchpad show, t_pos
}

