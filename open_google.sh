#!/bin/bash

# Definir nombre para la búsqueda en Google
NOMBRE="SOY TU PEOR PESADILLA"

# Abrir Google con el nombre
xdg-open "https://www.google.com/search?q=${NOMBRE}"

# Abrir la imagen de "hackeo"
HACK_IMAGE="https://i.imgur.com/EsnPdi3.jpg"
sleep 2
xdg-open "${HACK_IMAGE}"

