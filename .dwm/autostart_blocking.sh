export PATH="$HOME/.local/bin:$PATH"

background_image=${background_image:-~/.dwm/background.jpg}

feh --bg-scale $background_image

dunst &
