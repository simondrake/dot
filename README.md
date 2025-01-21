## Cloning into home directory

* `git init`
* `git remote add origin https://github.com/simondrake/dot.git`
* `git pull origin main`

## Work related files

To keep work stuff in a work-related VCS, these dot files utilise the following patterns:

#### ZSH config.

If the `~/workdot/.zshrc` file exists, it will be sourced and used. Use this to define work-related aliases, scripts etc.

#### Nvim config

If the `~/.config/nvim/lua/work` directory exists, it will overload the existing configuration.

For example, if the base configuration specifies:

```lua
require("decorated_yank").setup({
	domains = {
		github = {
			url = "github.com",
			blob = "/blob/",
			line_format = "#L%s-L%s",
		},
	},
})
```

Create a `init.lua` file, and `plugins` directory, in `~/.config/nvim/lua/work/`.

```lua
-- init.lua
require("work/plugins/decorated_yank")
```

```lua
-- plugins/decorated_yank.lua
require("decorated_yank").setup({
	domains = {
		github = {
			url = "github.com",
			blob = "/blob/",
			line_format = "#L%s-L%s",
		},
		currentOrg = {
			url = "your.org.domain",
			blob = "/-/blob/",
			line_format = "#L%s-%s",
		},
	},
})
```

The configuration will then be overloaded to include `currentOrg`.

## Setup

* Install [Homebrew](https://brew.sh/)
* Install [Node.js](https://nodejs.org/en/)
* Install [Go](https://go.dev/doc/install)
* Install [tmux](https://github.com/tmux/tmux/wiki/Installing)

* Install zsh
* Install `oh-my-zsh` - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
* Run the `setup.sh` script
* Run the `vim.sh` script

* Run the `go.sh` script
* Run the `lsp.sh` script to set-up nvim LSP specific things
* Run the `rust.sh` script

* Set-up git configs - https://www.freecodecamp.org/news/how-to-handle-multiple-git-configurations-in-one-machine/

```
## .gitconfig
[includeIf "gitdir:~/development/personal/"]
  path = ~/.gitconfig-personal
[includeIf "gitdir:~/development/work/"]
  path = ~/.gitconfig-work

## .gitconfig-personal
[user]
 name = Simon Drake
 email = email@domain.com
```

* Install `build-essentials` - `sudo apt-get install build-essential`

* Clone https://github.com/simondrake/kickstart.nvim into ~/.config/nvim

## Optional

* Run `fontSetup.sh` for instructions on how to install Fira Code
* Run `install-git-completion.sh`
* Run `packages.sh`
* Run `drop-down-term.sh` to install iterm2. Instructions to emulate drop-down-term are in the script.

## Firefox

* `sudo cp firefox-prefs/config.js /opt/firefox/config.js`
* `sudo cp firefox-prefs/autoconfig.js /opt/firefox/defaults/pref/autoconfig.js`

### Extensions

* Bitwarden
* [Ctrl+Number to switch tabs](https://addons.mozilla.org/firefox/addon/ctrl-number-to-switch-tabs/)
* uBlock

## Apps
Refer to https://www.simondrake.dev/uses

## Custom Shortcuts

* Name: `Flameshot`, Command: `flameshot gui`, Shortcut: `Print`
* Name: `Flameshot Timed`, Command: `flameshout gui --delay 2000`, Shortcut: `Shift + Print`
* Name: `copyq`, Command: `copyq show`, Shortcut: `Shift + Ctrl + K`

* Navigation > `Switch applications` > `Ctrl + Tab`
* Navigation > `Switch windows of an application` > `Ctrl + \\\``


## Other

* Disable `Enhanced Tiling` under `Settings > Ubuntu Desktop`
* Disable Ubuntu notification badges - `gsettings set org.gnome.shell.extensions.dash-to-dock show-icons-emblems false`
* Run `ibus-setup` and remove the `Unicode code point` shortcut to remove the `Ctrl + Shift + U` shortcut
