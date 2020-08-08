**Install syncthing, latest: release branch**

To download and make executeable, run:

```bash
wget https://raw.githubusercontent.com/99stack/installer/master/debian-latest/syncthing/syncthing.bash && chmod +x syncthing.bash
```

Start installation with:

```bash
./syncthing.bash
```

A user with sudo privileges is required. It's recomended to run as sudo user instead of root.

After installation, add the following line to crontab for root:

```bash
@reboot sudo -u nginx /usr/bin/syncthing -no-browser -home="/etc/syncthing" > /dev/null 2>&1
```

In order to start syncthing once the server starts.
