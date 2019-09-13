get_ram_readable() {
    ramused=0
    base=''
    humanRAM=''
    ramused=$(echo $(($(grep -o -E "MemTotal:\s+[0-9]+" /proc/meminfo | grep -o -E "[0-9]+") - $(grep -o -E "MemAvailable:\s+[0-9]+" /proc/meminfo | grep -o -E "[0-9]+"))))
    declare -a suffixes=('B' 'K' 'M' 'G' 'T')
    size=$ramused
    remainder=""
    index=1
    while [ $(($size / 102)) -gt 1 ]; do
      remainder=".$(( $size % 1024))"
      size=$(( size / 1024 ))
      index=$(( index + 1 ))
    done

    suffix="${suffixes[$index]}"
    cut_remainder=$(printf "%0.2f" $remainder | cut -c 2-)
    echo "$size$cut_remainder$suffix"
}

# Show how much RAM application uses.
# $ ram safari
# # => safari uses 154.69 MBs of RAM.
# from https://github.com/paulmillr/dotfiles
ram() {
	local sum
	local items
	local app="$1"
	if [ -z "$app" ]; then
		echo "First argument - pattern to grep from processes"
	else
		sum=0
		for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
		sum=$(($i + $sum))
	done
		sum=$(echo "scale=2; $sum / 1024.0" | bc)
	if [[ $sum != "0" ]]; then
		echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
	else
		echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
	fi
	fi
}
