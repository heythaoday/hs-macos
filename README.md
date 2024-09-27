# Hammerspoon Configuration

This repository contains a set of Hammerspoon configurations for managing windows, audio devices, volume control, and more.

## Files and Directories

- `app_manager.lua`: Manages application launching and focusing.
- `audio_device_manager.lua`: Manages audio output device selection.
- `hotkey_display.lua`: Displays all configured hotkeys.
- `init.lua`: Main configuration file that binds hotkeys to various functions.
- `ui/`: Contains UI-related modules.
  - `canvas.lua`: Provides a function to create a canvas for displaying information.
- `volume_control.lua`: Manages volume control.
- `window_manager.lua`: Manages window positioning and resizing.
- `youtube_control.lua`: Manages YouTube playback controls.

## Hotkeys

### General Hotkeys

- `ctrl + alt + shift + H`: Show all hotkeys.
- `ctrl + alt + shift + R`: Reload Hammerspoon configuration.

### Volume Control

- `alt + -`: Volume Down.
- `alt + =`: Volume Up.

### Audio Device Management

- `ctrl + alt + C`: Choose audio output device.

### Media Control

- `ctrl + alt + P`: Toggle Play/Pause.
- `ctrl + alt + N`: Next Video.

### Application Shortcuts

- `alt + 1`: Google Chrome.
- `alt + 2`: Visual Studio Code.
- `alt + 3`: iTerm.
- `alt + Q`: Safari.
- `alt + W`: Things3.
- `alt + E`: Fork.

### Window Management

- `ctrl + alt + M`: Maximize window with 10px padding.
- `ctrl + alt + C`: Center window (uncomment in `init.lua` to enable).
- `ctrl + alt + Left`: Move window to left half (uncomment in `init.lua` to enable).
- `ctrl + alt + Right`: Move window to right half (uncomment in `init.lua` to enable).
- `ctrl + alt + Up`: Move window to top half (uncomment in `init.lua` to enable).
- `ctrl + alt + Down`: Move window to bottom half (uncomment in `init.lua` to enable).

## Installation

1. Install [Hammerspoon](https://www.hammerspoon.org/).
2. Clone this repository to your Hammerspoon configuration directory (`~/.hammerspoon`).

```sh
git clone https://github.com/thao0day/hs-macos ~/.hammerspoon
```
3. Reload Hammerspoon configuration or restart Hammerspoon.

## Usage
Once installed, you can use the configured hotkeys to manage windows, control volume, switch audio devices, and more.

## License

This project is licensed under the MIT License.