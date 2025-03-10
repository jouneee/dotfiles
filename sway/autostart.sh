# Autostart

set $gnome-schema org.gnome.desktop.interface

exec_always {
    gsettings set $gnome-schema gtk-theme 'Adwaita-dark'
    gsettings set $gnome-schema icon-theme 'elementary'
    gsettings set $gnome-schema cursor-theme 'Adwaita-dark'
    gsettings set $gnome-schema font-name 'Maple Mono NF'
}
