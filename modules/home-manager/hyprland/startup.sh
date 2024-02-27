eval "$(ssh-agent -s)"
ssh-add ~/.ssh/github &> /dev/null

waybar &
hyprpaper >~/hyprpaper.log 2>&1