# KEY BINDINGS
  # Start a terminal
  bindsym $mod+d exec $term

  # Kill focused window
  bindsym $mod+q kill

  # Start your launcher
  bindsym $mod+space exec $menu

  # Start your browser
  bindsym $mod+Shift+b exec $browser

  # Screenshot
  bindsym $mod+Print exec $screenshot

  # Lock screen
  bindsym $mod+l exec $swaylock

  # Suspend laptop
  bindswitch --reload --locked lid:on exec swaylock & systemctl suspend

  # Mod-Keys
  bindsym $key_brightnessup exec $brightnessup
  bindsym $key_brightnesdown exec $brightnessdown

  bindsym $key_audiomute exec $volumetoggle
  bindsym $key_inputmute exec $inputmute
  bindsym $key_volup exec $volumeup
  bindsym $key_voldown exec $volumedown

# Drag floating windows by holding down $mod and left mouse button.
# Resize them with right mouse button + $mod.
# Despite the name, also works for non-floating windows.
# Change normal to inverse to use left mouse button for resizing and right
# mouse button for dragging.
floating_modifier $mod normal

# Reload the configuration file
bindsym $mod+Shift+c reload

# Exit sway (logs you out of your Wayland session)
bindsym $mod+Shift+e exec $killsway

# Restart waybar
bindsym $mod+Shift+w exec $restartwaybar

#
# Moving around:
#
    bindsym $mod+Left focus left
    bindsym $mod+Down focus down
    bindsym $mod+Up focus up
    bindsym $mod+Right focus right

    bindsym $mod+Shift+Left move left
    bindsym $mod+Shift+Down move down
    bindsym $mod+Shift+Up move up
    bindsym $mod+Shift+Right move right
#
# Workspaces:
#
    # Switch to workspace
    bindsym $mod+1 workspace code
    bindsym $mod+2 workspace browse
    bindsym $mod+3 workspace terminal
    bindsym $mod+4 workspace chat
    bindsym $mod+5 workspace personal
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
    bindsym $mod+0 workspace number 10
    # Move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace code
    bindsym $mod+Shift+2 move container to workspace browse
    bindsym $mod+Shift+3 move container to workspace terminal
    bindsym $mod+Shift+4 move container to workspace chat
    bindsym $mod+Shift+5 move container to workspace personal
    bindsym $mod+Shift+6 move container to workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9
    bindsym $mod+Shift+0 move container to workspace number 10
    # Note: workspaces can have any name you want, not just numbers.
    # We just use 1-10 as the default.
#
# Layout stuff:
#
    # You can "split" the current object of your focus with
    # $mod+b or $mod+v, for horizontal and vertical splits
    # respectively.
    # bindsym $mod+b splith
    # bindsym $mod+v splitv

    # Switch the current container between different layout styles
    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split

    # Make the current focus fullscreen
    bindsym $mod+f fullscreen

    # Toggle the current focus between tiling and floating mode
    bindsym $mod+v floating toggle

    # Swap focus between the tiling area and the floating area
    # bindsym $mod+space focus mode_toggle

    # Move focus to the parent container
    bindsym $mod+a focus parent
#
# Scratchpad:
#
    # Sway has a "scratchpad", which is a bag of holding for windows.
    # You can send windows there and get them back later.

    # Move the currently focused window to the scratchpad
    bindsym $mod+Shift+minus move scratchpad

    # Show the next scratchpad window or hide the focused scratchpad window.
    # If there are multiple scratchpad windows, this command cycles through them.
    bindsym $mod+minus scratchpad show

bindsym $mod+Ctrl+Left resize shrink width 100px
bindsym $mod+Ctrl+Down resize grow height 100px
bindsym $mod+Ctrl+Up resize shrink height 100px
bindsym $mod+Ctrl+Right resize grow width 100px

# RESIZING WINDOWS
mode "resize" {
    # left will shrink the containers width
    # right will grow the containers width
    # up will shrink the containers height
    # down will grow the containers height

    bindsym Left resize shrink width 10px
    bindsym Down resize grow height 10px
    bindsym Up resize shrink height 10px
    bindsym Right resize grow width 10px

    # Return to default mode
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+r mode "resize"
