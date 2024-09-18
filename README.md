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

* Install `oh-my-zsh` - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
* Run the `setup.sh` script
* Run the `vim.sh` script

* Run the `go.sh` script
* Run the `lsp.sh` script to set-up nvim LSP specific things
* Run the `rust.sh` script

* Set-up git configs - https://www.freecodecamp.org/news/how-to-handle-multiple-git-configurations-in-one-machine/

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

### Apps
* [Skitch](https://evernote.com/products/skitch) OR [Lightshot](https://app.prntscr.com/en/index.html)
* [Rectangle](https://rectangleapp.com/)
* [Flycut](https://github.com/TermiT/Flycut)
* [Wally](https://ergodox-ez.com/pages/wally)
