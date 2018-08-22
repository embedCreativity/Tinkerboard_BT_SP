#!/bin/sh -e

echo "Restarting bluetooth service..."
sudo systemctl restart bluetooth
sleep 5
echo "Starting rtl hci script..."
sudo ./start_bt.sh
sleep 10
echo "Calling hciconfig hci0 up..."
sudo /bin/hciconfig hci0 up
sleep 5
echo "/bin/hciconfig hci0 sspmode 1..."
sudo /bin/hciconfig hci0 sspmode 1
echo "/bin/hciconfig hci0 piscan..."
sudo /bin/hciconfig hci0 piscan
echo "/usr/bin/sdptool add --channel=22 SP..."
sudo /usr/bin/sdptool add --channel=22 SP
echo "Launching SSP listener..."
sudo rfcomm listen /dev/rfcomm0 22

exit 0
