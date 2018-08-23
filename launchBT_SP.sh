#!/bin/sh -e

echo "Restarting bluetooth service..."
sudo systemctl restart bluetooth
sleep 10
echo "Starting rtl hci script..."
sudo ./start_bt.sh
sleep 10
echo "Checking hciconfig -a... (Ctrl-C if needed)"
hciconfig -a
sleep 5
echo "Calling hciconfig hci0 up..."
sudo /bin/hciconfig hci0 up
sleep 5
echo "Setting device class to Desktop Workstation"
sudo /bin/hciconfig hci0 class 0x104
echo "/bin/hciconfig hci0 sspmode 1..."
sudo /bin/hciconfig hci0 sspmode 1
echo "/bin/hciconfig hci0 piscan..."
sudo /bin/hciconfig hci0 piscan
echo "/usr/bin/sdptool add --channel=22 SP..."
sudo /usr/bin/sdptool add --channel=22 SP
echo "Launching SSP watcher..."
sudo rfcomm watch /dev/rfcomm0 22

exit 0
