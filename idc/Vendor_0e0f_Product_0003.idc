# VMware Virtual USB Mouse (USB 0e0f:0003): absolute-axis device.
# Must be classified as pointer, otherwise EventHub treats it as a
# touchscreen: touches still dispatch, but no visible cursor is drawn.
touch.deviceType = pointer
cursor.orientationAware = 1
