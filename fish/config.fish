if status is-login
    # if uwsm check may-start && uwsm select
    #     exec uwsm start default
    # end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

abbr -a py '~/.pyvenv/bin/python3'
abbr -a nv nvim
abbr -a zed zeditor

abbr -a f 'flatpak'
abbr -a fu 'flatpak update'
abbr -a fi 'flatpak install'
abbr -a fiu 'flatpak install --user'
abbr -a s 'sudo pacman -S'
abbr -a sy 'sudo pacman -Sy'
abbr -a ss 'pacman -Ss' 
abbr -a syu 'sudo pacman -Syu'
abbr -a yss 'yay -Ss'

abbr -a sc 'sudo systemctl' 
abbr -a scu 'systemctl --user'

abbr -a +x 'chmod +x'
abbr -a +X 'chmod +x'
abbr -a ll 'ls -lh' 
abbr -a la 'ls -lah' 
abbr -a .2 'cd ../..'
abbr -a .3 'cd ../../..' 

abbr gpl 'git pull'
abbr -a --set-cursor='%' -- gcm 'git commit -m "%"'
abbr gp 'git push'

# быстрые команды для управления zapret
alias zapret-config='$HOME/zapret-configs/install.sh'
alias zapret-utils='$HOME/zapret-configs/utils-zapret.sh'
