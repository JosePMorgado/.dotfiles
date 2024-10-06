# INFO

Welcome to my personal Tmux configuration.

First of all I would like you to keep in mind that this is a comprehensive custom-made guide with the aim of making my workflow and the workflow of those who follow my path much more comfortable. So in case we forgot what each shortcut do, we can come back here to look for it.

A lot of people often ask me how I configure my tools, so by making this file I want to solve the issue of having to continually explain how I do it by referring those who want to know my configuration to this file, saving time for all of us. The most of the config is keept the default config, but in some cases I change the default config for another that does not create any conflict with other configs.

I hope you find it useful, and if you do, feel free to fork it and customize it for yourself by adding changes and personal preferences.

I will edit this file whenever I feel the need to add new shortcuts or modify existing ones.

## Concepts
In order to understand the commands and shortcuts properly, it is necesary to define some essential concepts.

### Sessions
A session is the top most layer in Tmux and is a collection of windows. You can have one or more sessions opened at the same time but you can only have one session attached at a time. The ID of the session currently attached will be shown at the status bar between brackets, and it is 0 by default '[0]'.

### Windows
A window is a container of one or more panes. While working with Tmux you are using at least one window inside a session. The ID of the windows will be shown at the status bar between brackets as well as their names. The IDs will be numbered starting on 0 by default. The currently used window is marked with an asterisk at the right of its name.

### Pane
A panes is a subdivision of a single window. While working with Tmux you are using at least one pane inside a window. There will only be one active pane at a time.

## Commands and Shortcuts

To be able to handle Tmux correctly, we need to know some essentials commands, as well as the most frequently used shortcuts.

## Commands

> [!NOTE]
> There are some cases where you can achieve the same result by using a command and/or a shortcut. In those cases the shortcut will obtain preference over the command because of its ease of use. That means that I wont be adding the command to this file to avoid redundancy.

> [!IMPORTANT]
> There are commands that you can use either outside or inside tmux, and others that can only be use outside tmux. I will put them separately.

### Outside Tmux
-Initialize a new session:
```
tmux
```
```
tmux new
```
```
tmux new-session -s <NAME>
```
-Attatch to an existing session:
```
tmux a -t <NUMBER OF SESSION>
```
```
tmux attach-session -t <ID OF SESSION>
```

### Outside and Inside Tmux
-Show a list of existing sessions:
```
tmux ls
```
```
tmux list-sessions
```
-Show the Tmux version:
```
tmux -V
```
-Change to ssession:
```
tmux -switch -t <NAME or ID OF SESSION>
```
-End a session:
```
tmux -kill-session -t <NAME or ID OF SESSION>
```
### Tmux CLI
-Change windows name:
```
rename-window <NAME>
```

## Shortcuts
>[!NOTE]
>The default `Prefix`is `C+b` (But you can change the `Prefix` by customizing the `.tmux.conf` file located in the `$HOME` directory.
>On Linux the `C key is Control`, the `S key is Shift`, and the `M key is Alt`.

>[!TIP]
>You can access the following information in the terminal by using the command `Prefix ?`

### Sessions
- `Prefix w` Shows a windows preview for each session (Kill sessions/windows with `x` or attach a session with `Enter`).
- `Prefix s` Shows a sessions list.
- `Prefix d` Detach the current tmux session.
- `Prefix $` Rename session.
- `Prefix :` Open Tmux CLI.
  
### Windows
> [!NOTE]
> An asterisk `*` will mark the current window.

- `Prefix &` Kill the active window.
- `Prefix c` New window.
- `Prefix ,` Rename window.
- `Prefix n` Next window.
- `Prefix p` Previous window.
- `Prefix ID` Move to a specific window.
  
### Panes
- `Prefix &` Kill the active pane without confirmation.
- `Prefix x` Kill the active pane but need confirmation with `Y Enter`.
- `Prefix C+%` Vertical pane split. 
- `Prefix C+"` Horizontal pane split.
- `Prefix q [PANE_NUMBER]` Change pane by using the numbers.
- `Prefix [h,j,k,l]` Change pane by using the Vim direction keys (h-left, j-down, k-up, l-right).
- `Prefix  hold C+[h,j,k,l]` Pane resize.
- `Prefix z"` Zoom a pane, hidding the others.
- `Prefix !"` Turn a pane into a window.
- `Prefix M+[1-5]` Change the pane layout to:
  - 1. even-horizontal
  - 2. even-vertical
  - 3. main-horizontal
  - 4. main-vertical
  - 5. tiled

## Tmux customization

>[!IMPORTANT]
> If you don't have the enviroment variable `$XDG_CONFIG_HOME` (which you can check with the command `env | grep XDG_CONFIG_HOME`) you must create it. To do that pay attention to the following section, and read it completly before issue any commands.

### Configuring the shell
We need to add a permanent enviroment variable to our shell, and we can do that in two ways.
The easiest one is to add it to a specific shell, which in my case is Zsh, and we would do it by issuing the following command:
```
echo XDG_CONFIG_HOME="$HOME/.config" >> ~/.zshrc
```

The more complex way is to create a global shell configuration that works for all our shells (Bash and Zsh in my case). To do so we have two create a script into the `/etc/profile.d/` directory (For what you need to execute the command as `sudo`). I called the script `global_shell_config.sh`. Once done that we must add the following line to the script:
```
export XDG_CONFIG_HOME="$HOME/.config"
```

### Customization
You can customize Tmux by creating a new file, either globally or locally. If you want to configure Tmux globally, you must create the `tmux.conf` into the `/etc` directory like this `/etc/tmux.conf`. If you want to configure Tmux locally you must create a new local file called `tmux.conf` into the `$XDG_CONFIG_HOME/tmux` directory like this `$XDG_CONFIG_HOME/tmux/tmux.conf` or you can create a `.tmux.conf` hidden file into the `$HOME` directory. 
I personally use the `$XDG_CONFIG_HOME/tmux/tmux.conf` file because the `$XDG_CONFIG_HOME` directory is suposed to be use for the configuration files, and it use to be a `.config` directory inside `$HOME`.

To create the file you can issue this command (I use nvim to edit, but you can use whichever editor you prefer)
```
mkdir -p $XDG_CONFIG_HOME/tmux && nvim $XDG_CONFIG_HOME/tmux/tmux.conf
```

### Editing the tmux.conf

- Change the `Prefix`:
```
# Change prefix from 'Ctrl b' to 'Ctrl f'
unbind C-b
set-option -g prefix C-f
bind-key C-f send-prefix
```
- Change the initial window ID to 1:
```
# Start counting pane and window number at 1
set -g base-index 1
setw -g pane-base-index 1
```
- Shift between windows:
```
# Shift between windows
bind -n M-H previous-window
bind -n M-L next-window
```
- Open new panes in current directory:
```
# Open new panes in current directory
bind '"' split-window -v -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
```
- Add plugins to the list, first we add the [Tmux Plugin Manager plugin](https://github.com/tmux-plugins/tpm), and after that we add the [Catppuccin plugin](https://github.com/catppuccin/tmux) to edit the Tmux appearance:
```
# List of plugins
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'catppuccin/tmux'
```
- Set the Catppuccin configuration. I use the [Config 3](https://github.com/catppuccin/tmux?tab=readme-ov-file#config-3) preset but with some changes.
```
# Catppuccin config
set -g @catppuccin_window_left_separator ""
set -g @catppuccin_window_right_separator " "
set -g @catppuccin_window_middle_separator " █"
set -g @catppuccin_window_number_position "right"

set -g @catppuccin_window_default_fill "number"
set -g @catppuccin_window_default_text "#W"

set -g @catppuccin_window_current_fill "number"
set -g @catppuccin_window_current_text "#W"

set -g @catppuccin_status_modules_right "directory user host session"
set -g @catppuccin_status_left_separator  " "
set -g @catppuccin_status_right_separator ""
set -g @catppuccin_status_fill "icon"
set -g @catppuccin_status_connect_separator "no"

set -g @catppuccin_directory_text "#{pane_current_path}"

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '$XDG_CONFIG_HOME/tmux/plugins/tpm/tpm'
```

## Installing plugins
For install a plugin we have to do the following things:

- In first place we have to add the plugin into the `$XDG_CONFIG_HOME/tmux/plugin/` directory.
```
git clone https://github.com/tmux-plugins/tpm $XDG_CONFIG_HOME/tmux/plugins/tpm
```
- In second place we have to add the plugin to the `tmux.conf` file as we did in the section above.

- In third place we use the shortcut `Prefix I` to install the plugin.

## Update plugins
To update plugins simply use the shortcut `Prefix U`.

## Uninstall plugins
To uninstall plugins you have to remove them from the plugins list inside the `tmux.conf` file and after that we have to use the shortcut `Prefix M u`
>[!NOTE]
>Remember that on Linux the `C key is Control`, the `S key is Shift`, and the `M key is Alt`.

## Summary
In this article you have learned what Tmux is and how it is useful to improve workflow. Keyboard shortcuts to increase speed and efficiency of operation. The shortcuts I have personally configured so as not to conflict with other software.


So, if this article has been useful to you, all I ask in return is that you mark it with a star ⭐, because with a single click you reward all my effort and time.

If you want my personal config file `tmux.conf`, you can download the whole Tmux directory, which includes this guide.

## Thanks
In the research process I usually read the official manuals and repositories first, but as a complementary path I like to look at more content and documents from the community in order to create the most complete guide for myself. I want to thank all the people who inspired me or from whom I learned some of the concepts in this guide for their amazing work.

### Oficial Documents
- [Tmux Repository](https://github.com/tmux/tmux)

### Community
- [Typecraft](https://www.youtube.com/@typecraft_dev)
- [DreamsOfCode](https://www.youtube.com/@dreamsofcode)
