#!/usr/bin/env bash

# Check if /tmp is writeable
if [ ! -w "/tmp" ]; then
  echo "⛔ Directory '/tmp' is not writeable by the user. Aborting!"
  echo "UID: $(id)"
  echo "Directory Info: $(ls -lhd /tmp)"
  exit 255
fi

# Check if /home/ubuntu is writeable
if [ ! -w "/home/ubuntu" ]; then
  echo "⛔ Directory '/home/ubuntu' is not writeable by the user. Aborting!"
  echo "UID: $(id)"
  echo "Directory Info: $(ls -lhd /home/ubuntu)"
  exit 255
fi

# Check if VNC_PASSWORD is set, otherwise generate a random password
if [ -z "$VNC_PASSWORD" ]; then
  VNC_PASSWORD=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 16)
  echo "🔑 VNC_PASSWORD was not set. Generated password: $VNC_PASSWORD"
fi

# Set the VNC password for the user 'ubuntu'
mkdir -p /home/ubuntu/.vnc
echo "$VNC_PASSWORD" | vncpasswd -f > /home/ubuntu/.vnc/passwd
chmod 600 /home/ubuntu/.vnc/passwd

exec /usr/bin/tigervncserver -fg -localhost no :0 -xstartup /usr/bin/xfce4-session