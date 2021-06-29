


# INSTALL
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# CHANGE SHELL

chsh -s $(which zsh)


# To get special fonts to display correctly

sudo apt-get install fonts-powerline
sudo apt-get install xfonts-terminus
# Actually: font RobotMono is better looking

Install manually RobotoMono font ? Should not be necessary (pb in letter spacing in urxvt config)

# FASD install
sudo add-apt-repository ppa:aacebedo/fasd
sudo apt-get update
sudo apt-get install fasd

in ~/.zshrc

ZSH_THEME=agnoster
plugins=(git vi-mode fasd)

brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

# Add into .zshrc
source ${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
