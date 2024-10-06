# Guide of Wezterm

## Installation of Wezterm on Fedora
In my case I have the Fedora 40 distro, so as it is said in the [Wezterm Installation Official Page](https://wezfurlong.org/wezterm/install/linux.html](https://wezfurlong.org/wezterm/install/linux.html#__tabbed_1_5)) for the Fedora distro:
>[!NOTE]
>It is recommended that you install via Copr so that it is easiest to stay up to date as future versions of wezterm are released.

So we go to the [Wezterm Installation Official Page from Copr Repository](https://wezfurlong.org/wezterm/install/linux.html#__tabbed_1_4).

We should issue two commands:

```
sudo dnf copr enable wezfurlong/wezterm-nightly
sudo dnf install wezterm
```

And that's all, with those commands we have just installed the Wezterm terminal emulator.

## Configuration of Wezterm on Fedora
In this section I'll explain all my Wezterm configuration.
>[!NOTE]
>If you just want to set the same configuration as me without tangling with it, feel free to just download the `wezterm.lua` config file and move it into the `$XDG_CONFIG_HOME/wezterm` directory.

In the case that you want to know the  my configuration to be able to edit it with your own customization, feel free to fork either the whole directory or just the `wezterm.lua` file and modify it at will.

### Installing the fonts
Before we start editing the configuration file we must install two fonts, the main font, and a backup font. I decided to use the font [Hack](https://sourcefoundry.org/hack/) (By [Source Foundry](https://github.com/source-foundry/Hack/blob/master/docs/CONTRIBUTORS.md)) as main font and [Fira Code](https://github.com/tonsky/FiraCode) (By [Nikita Prokopov](https://github.com/tonsky)) as a backup font.
To install the Hack font we will follow the [oficial advice](https://github.com/source-foundry/Hack?tab=readme-ov-file#package-managers) and install it with the package manager (dnf). In this case the repository for Fedora is maintained in Copr by [Zawertun](https://copr.fedorainfracloud.org/coprs/zawertun/hack-fonts/).

>[!TIP]
>If you want to install the fonts globally you should use `sudo` to install it as `root`.

The commands that we must issue are two. The first one to set up the repository and the second one to install the Hack font from that repository.
```
sudo dnf copr enable zawertun/hack-fonts
sudo dnf install hack-fonts
```
To install the Fira Code font we just have to install it directly from the Fedora oficial repositories, so we just have to issue the commands:
```
sudo dnf install fira-code-fonts
```

### Editing the configuration file
- In first place we have to create a the directory `$XDG_CONFIG_HOME/wezterm`.
- After that we must create a `wezterm.lua` file and move it into the `$XDG_CONFIG_HOME/wezterm` directory.
- The next step is to edit the `wezterm.lua` file

In the configuration file first we pull the wezterm API and save it into the local variable called `wezterm`.
```
local wezterm = require 'wezterm'
```

Then we create a local variable called `config` where we hold the configuration choices.
```
local config = wezterm.config_builder()
```
After those two lines, we set our desired configuration.
The font size is 12 by default, but I like to increase it two points to 14.
We just have to configure the font family and the weight of the main and backup fonts.
```
-- Change the font
config.font_size = 14
config.font = wezterm.font('Hack', { weight = 'Regular'})
config.font = wezterm.font_with_fallback {
  { family = 'Fira Code', weight = 'Regular'},
}
```
I like to set a translucent background so I can see the desktop wallpaper. The 0 value would be full transparent and the 1 vañue would be 
```
-- Change the background opacity
config.window_background_opacity = 0.75
```
```
-- and finally, return the configuration to wezterm
return config
```

## Summary
In this article you have learned how to install the Wezterm terminal emulator, as well as how to enable the copr repositories where the wezterm files are hosted as well as the Hack font.
You also learned how to install Fira Code font and how to configure the wezterm terminal emulator by editing its config file with my personal configuration.

If this article has been useful to you, all I ask in return is that you mark it with a star ⭐, because with a single click you reward all my effort and time.

