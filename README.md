# What ?

A simple script opening `ssh://` urls in a dedicated tmux session.

# Why ?

So you can click on `ssh://` links in your browser without having thousands
of terminal windows (at least!) opening everywhere.

# How ?

- Clone this repo somewhere
- Create a file in `~/.local/share/applications/ssh-handler.desktop` with the
following content (update the `Exec` line with your specifics) :

```
[Desktop Entry]
Type=Application
Name=SSH Handler
Exec=/home/you/.local/bin/tmux-ssh-handler.sh %u
Icon=utilities-terminal
StartupNotify=false
MimeType=x-scheme-handler/ssh
```

- Copy file `tmux-ssh-handler.sh` to `~/.local/bin/tmux-ssh-handler.sh` (create `~/.local/bin` if needed)

- Ask your environment to use this config file to handle ssh links :

```
$ xdg-mime default ssh-handler.desktop x-scheme-handler/ssh
```

- Celebrate.

Tested on Ubuntu 15.04 (Unity) and Fedora 22 (Gnome).
