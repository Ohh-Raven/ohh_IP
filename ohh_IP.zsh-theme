# Author : Offensive Hacker (https://github.com/Ohh-Raven)
# OhMyZsh theme for CTFs (Capture The Flag)
# Show the tun0/VPN IP address

PROMPT='
┌─[%F{blue} %~%f] [%F{green} $(get_ip_address)%f ] $(git_prompt_info)
└─➜ '

RPROMPT='[%F{red}%?%f]'

get_ip_address() {
  if [[ -n "$(ifconfig tun0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig tun0 | awk '/inet / {print $2}')%{$reset_color%}"
  elif [[ -n "$(ifconfig wlan0 2>/dev/null)" ]]; then
    echo "%{$fg[green]%}$(ifconfig wlan0 | awk '/inet / {print $2}')%{$reset_color%}"
  else
    echo "%{$fg[red]%}No IP%{$reset_color%}"
  fi
}

