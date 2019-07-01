# KvantumEasyMc

Bootstraps a MacOS-like look with Kvantum and some of the most popular themes/icon packages available to date.

![screenshot](files/screenshot.jpg)

# Usage

1. Download [this script](https://github.com/caglarturali/KvantumEasyMc/raw/master/KvantumEasyMc.sh).
2. Make it executable.

   `chmod +x KvantumEasyMc.sh`

3. Run.

   `./KvantumEasyMc.sh`

## Supported distributions

- Debian derivatives

## Tested on

- KDE neon 5.16 User Edition

## Notes

- Panel shadows are removed by default. If you want to bring it back, run commands below and than restart your session.

  ```
  cd ~/.local/share/plasma/desktoptheme/McMojave/widgets/
  rm panel-background.svgz && mv panel-background.svgz.BAK panel-background.svgz
  cd ~/.local/share/plasma/desktoptheme/McMojave-light/widgets/
  rm panel-background.svgz && mv panel-background.svgz.BAK panel-background.svgz
  ```

## Implements

- [Kvantum](https://github.com/tsujan/Kvantum)
- [McMojave KDE Themes](https://github.com/vinceliuice/McMojave-kde)
- [Mojave Gtk Theme](https://github.com/vinceliuice/Mojave-gtk-theme)
- [McMojave-circle Icon Theme](https://github.com/vinceliuice/McMojave-circle)
- [Capitaine Cursors](https://github.com/keeferrourke/capitaine-cursors)
- [SierraBreeze](https://github.com/ishovkun/SierraBreeze)
- [Active Window Control Applet](https://store.kde.org/p/998910/)
- [Latte dock](https://github.com/KDE/latte-dock)
- [Aritim-Dark Konsole](https://store.kde.org/p/1283010/)
- [Yet Another Magic Lamp](https://github.com/zzag/kwin-effects-yet-another-magic-lamp)
