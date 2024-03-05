# Brightness Manager for KDE Plasma

This repository contains files that can increase or decrease the screen brightness by an amount other than the default 5.

# Use This in KDE Plasma's Keyboard Shortcuts

Prerequisites:  
Install `bc` on your system.  
Step 1:  
Go to `System Settings > Shortcuts`  
Step 2:  
Click the "Add command" button in the bottom.  
Step 3:  
Add path of the `decrease_brightness.sh` file first and press "Add"  
Step 4:  
Go to the tab that says the `decrease_brightness.sh` path and modify the keyboard shortcut by pressing the "Add custom shortcut" and then the key(s) to lower the screen brightness. Agree that you want to replace the original keyboard shortcut for decreasing the brightness.  
Step 5:  
Repeat step 4 but for the `increase_brightness.sh` path.
Step 6:  
Click the "Apply" button in the bottom-right corner.

## Notes

Don't change the path to the files (changing username's home folder, moving the file or folder to another place) or else you would have to manually update the path to the `decrease_brightness.sh` and `increase_brightness.sh` files.

Want to change the brightness step for the files when you add this in the keyboard shortcuts? Just change the number in the `increment.conf` file to a positive number.

# Build from source

Prerequistities:  
Install shc to compile shell to c code.  
Step 1:  
Run `cd src` in this directory.  
Step 2:  
Run `shc -vrf increase_brightness.sh -o ../build/increase_brightness` to compile the shell script.  
Step 3:  
Repeat step 2 but with decrease instead of increase.
