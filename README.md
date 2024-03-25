# Artimux
A clean dark theme for tmux, inspired by [janoamaral/tokyo-night-tmux](https://github.com/janoamaral/tokyo-night-tmux). I just added some widgets and YouTube
Music integration.

## Installation
#### Using TPM (Tmux Plugin Manager):
Add the plugin to the list of TPM plugins in `.tmux.conf`:
```bash
set -g @plugin 'tribhuwan-kumar/Artimux'
```
For more customization [see](https://github.com/janoamaral/tokyo-night-tmux#tokyo-night-tmux)

## TYM (Tmux YouTube Music)
A simple shell script for streaming YouTube Music in the terminal.

### Configuration of TYM:
#### Depndencies
- [`jq`](https://jqlang.github.io/jq/download/)
- [`mpv`](https://mpv.io/installation/)
- [`yt-dlp`](https://github.com/yt-dlp/yt-dlp/wiki/Installation)
- [`openbsd-netcat`](https://ftp.netbsd.org/pub/pkgsrc/current/pkgsrc/net/netcat-openbsd/index.html)
- [`atomicparsley`](https://github.com/wez/atomicparsley#install)

For Arch Linux
```bash
pacman -S jq mpv yt-dlp openbsd-netcat atomicparsley
```
### Config:
Create a symbolic of `tym.sh` in your `$PATH` and make it executable.
```bash
sudo ln -s ~/.tmux/plugins/Artimux/src/tym.sh /usr/local/bin/tym
```

### Usage
Just run `tym` along with the song name you want to play, It will search for that song in `~/Music/tym` directory, If the song is not found, then
it will search on YouTube and play it.
#### Flags:
- `-h` for help.
- `-r` for play the song in repeat mode.
- `-s` for shuffle the all songs of directory.

#### Keybindings
It uses the default keybindings of `mpv`, but you can customize it too
- `q` for quit.
- `m` for mute.
- `p` & `Space` for play/pause.
- `` & `` for seek backward and forward.
- `<` & `>` for playing next and previous song in shuffle mode.

## Widgets:
There is `Netspeed`, `Git` & `TYM` widget in this theme.
> [!NOTE]
>  All widgets are enabled by default.

<img src="https://github.com/tribhuwan-kumar/Artimux/assets/118052427/5eed1f74-c7cc-4015-aa8d-563ace436b52" />


###### Now enjoy YouTube Music & your local Music in terminal.

