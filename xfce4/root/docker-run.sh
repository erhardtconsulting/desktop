#!/usr/bin/env bash

# Check if /tmp is writeable
if [ ! -w "/tmp" ]; then
  echo "⛔ Directory '/tmp' is not writeable by the user. Aborting!"
  echo "UID: $(id)"
  echo "Directory Info: $(ls -lhd /tmp)"
  exit 255
fi

# Check if /home/ubuntu is writeable
if [ ! -w "/home/user" ]; then
  echo "⛔ Directory '/home/user' is not writeable by the user. Aborting!"
  echo "UID: $(id)"
  echo "Directory Info: $(ls -lhd /home/user)"
  exit 255
fi

# Check if VNC_PASSWORD is set, otherwise generate a random password
if [ -z "$VNC_PASSWORD" ]; then
  VNC_PASSWORD=$(tr -dc 'A-Za-z0-9' </dev/urandom | head -c 16)
  echo "🔑 VNC_PASSWORD was not set. Generated password: $VNC_PASSWORD"
fi

# Set the VNC password for the user 'ubuntu'
mkdir -p /home/user/.vnc
echo "$VNC_PASSWORD" | /usr/bin/vncpasswd -f > /home/user/.vnc/passwd
chmod 600 /home/user/.vnc/passwd

exec /usr/bin/supervisord -c /etc/supervisor/supervisord.conf