# What ?

A simple script opening `ssh://` urls in a dedicated tmux session.

# Why ?

So you can click on `ssh://` links in your browser without having thousands
of terminal windows (at least!) opening everywhere.

# How ?

It depends.

## Ubuntu 15.04 - Unity

- Clone this repo somewhere
- Create a file in `~/.local/share/applications/ssh-handler.sh` with the
following content (update the `Exec` line with your specifics) :

```
[Desktop Entry]
Type=Application
Name=SSH Handler
Exec=/home/adrien/.local/bin/tmux-ssh-handler.sh %u
Icon=utilities-terminal
StartupNotify=false
MimeType=x-scheme-handler/ssh
```

- Ask your environment to use this config file to handle ssh links

```
$ xdg-mime default ssh-handler.desktop x-scheme-handler/ssh
```

- Celebrate.

## Fedora 22 - Gnome shell

todo
