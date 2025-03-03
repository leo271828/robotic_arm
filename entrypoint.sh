#!/bin/bash
set -e

USERNAME="${USERNAME:-defaultuser}"
PASSWORD="${PASSWORD:-defaultpassword}"
DISPLAY="${DISPLAY:-host.docker.internal:0}"

apt-get update && apt-get install -y sudo

echo "Using DISPLAY: $DISPLAY"

# Create the user if it does not exist
if ! id "$USERNAME" &>/dev/null; then
    useradd -m -s /bin/bash -G sudo "$USERNAME"
    echo "$USERNAME:$PASSWORD" | chpasswd

    # Ensure DISPLAY is available for the new user
    echo "export DISPLAY=$DISPLAY" >> /home/$USERNAME/.bashrc
fi

echo "source /opt/ros/humble/setup.bash" >> /home/$USERNAME/.bashrc
# Switch to the user and start a new shell
exec su - "$USERNAME"
