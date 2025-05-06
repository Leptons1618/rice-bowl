# rice-bowl 🍚

A heaping bowl of Arch Linux ricing — tasty dotfiles, spicy configs, and crispy scripts to make your desktop deliciously beautiful. Warning: may cause excessive screenshot sharing.

## Installation

### Setting up Oh My Posh in Arch Linux

Oh My Posh provides a beautiful and customizable prompt for your shell.

1. **Install Oh My Posh:**

   ```bash
   # Using yay (AUR helper)
   yay -S oh-my-posh-bin
   
   # Or manual installation from GitHub releases
   sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
   sudo chmod +x /usr/local/bin/oh-my-posh
   ```

2. **Install themes:**

   ```bash
   # Create themes directory
   mkdir -p ~/.poshthemes
   
   # Download themes
   wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
   
   # Extract themes
   unzip -o ~/.poshthemes/themes.zip -d ~/.poshthemes
   chmod u+rw ~/.poshthemes/*.json
   rm ~/.poshthemes/themes.zip
   ```

3. **Install required fonts:**

   Download and install a Nerd Font from [nerdfonts.com](https://www.nerdfonts.com/font-downloads) or install via package manager:
   
   ```bash
   yay -S nerd-fonts-complete
   # or a specific font like
   yay -S ttf-meslo-nerd
   ```
   
   Configure your terminal to use the Nerd Font.

### Setting up Fish Shell

1. **Install Fish:**

   ```bash
   sudo pacman -S fish
   ```

2. **Set Fish as default shell:**

   ```bash
   chsh -s /usr/bin/fish
   ```

3. **Copy config file:**

   ```bash
   mkdir -p ~/.config/fish
   cp /path/to/rice-bowl/fish/config.fish ~/.config/fish/
   ```

### Additional dependencies

For full functionality of the provided config, install:

```bash
sudo pacman -S fortune-mod cowsay lolcat ranger
```

## Customization

The configuration files are made to be dynamic, automatically detecting your environment and adjusting paths accordingly. However, you may want to customize the Oh My Posh theme or other settings.

To preview and select a different theme:
```bash
ls ~/.poshthemes
oh-my-posh init fish --config ~/.poshthemes/THEME_NAME.omp.json | source
```

Then edit the `config.fish` file to set your preferred theme.
