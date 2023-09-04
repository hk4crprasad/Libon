#!/bin/sh

# Function to print a colorful progress bar
print_progress() {
  local width=40           # Width of the progress bar
  local percent=$1

  # Calculate the number of blocks to display
  local progress=$((width * percent / 100))

  # ANSI color codes for the bar and background
  local bar_color="\033[38;5;87m"  # Change the color code as desired
  local bg_color="\033[48;5;234m"  # Change the color code as desired
  local color_end="\033[0m"         # Reset color

  local bar="["
  local space=""

  for i in $(seq 1 $width); do
    if [ "$i" -le "$progress" ]; then
      bar+="${bar_color}█${color_end}"  # Use a solid block character
    else
      space+=" "
    fi
  done

  bar+="$space] $percent%"

  echo -ne "$bg_color$bar$color_end\r"  # Use -ne to overwrite the progress bar on the same line
}

# Example usage with a faster update interval
for i in $(seq 1 100); do
  print_progress "$i"
  sleep 0.05  # Faster update interval (adjust as needed)
done

echo  # Add a newline after completion
echo "Done!"
