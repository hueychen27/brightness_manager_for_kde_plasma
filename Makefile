FILES = $(wildcard ./*.sh)

.PHONY: install uninstall

install:
	kwriteconfig6 --file ~/.config/kglobalshortcutsrc --group "Global Shortcuts" --key "decrease_brightness" ""
	kwriteconfig6 --file ~/.config/kglobalshortcutsrc --group "Global Shortcuts" --key "increase_brightness" ""

	kwriteconfig6 --file ~/.config/kglobalshortcutsrc --group "Custom Shortcuts" --key "decrease_brightness" "CommandURL=$(pwd)/decrease_brightness.sh"
	kwriteconfig6 --file ~/.config/kglobalshortcutsrc --group "Custom Shortcuts" --key "increase_brightness" "CommandURL=$(pwd)/increase_brightness.sh"

uninstall:
	kwriteconfig6 --file ~/.config/kglobalshortcutsrc --group "Custom Shortcuts" --key "decrease_brightness" ""
	kwriteconfig6 --file ~/.config/kglobalshortcutsrc --group "Custom Shortcuts" --key "increase_brightness" ""

	kwriteconfig6 --file ~/.config/kglobalshortcutsrc --group "Global Shortcuts" --key "decrease_brightness" "decrease_brightness"
	kwriteconfig6 --file ~/.config/kglobalshortcutsrc --group "Global Shortcuts" --key "increase_brightness" "increase_brightness"
