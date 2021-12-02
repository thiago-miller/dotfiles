#!/usr/bin/env bash

while true; do
	if [[ -d "$HOME/Workspace/dotfiles" ]]; then
		echo "$HOME/.dotfiles already exists."
		read -p "Do you wish to overwrite it? [yN]: " yn
		yn=${yn:-No}
		case $yn in
			[Nn]* )
				echo "Tchau tchau."
				exit 0
				;;
			[Yy]* )
				echo "Removing '$HOME/.dotfiles'."
				rm -rf "$HOME/.dotfiles"
				;;
			* )
				echo "Please answer yes or no."
				;;
		esac
	fi
done

# Clone dotfiles and submodule to ~/.dotfiles
echo "Cloning and updating '$HOME/.dotfiles'."
git clone https://github.com/thiago-miller/dotfiles.git $HOME/.dotfiles
pushd $HOME/.dotfiles
git submodule update --init --recursive

# Install dependences if we are into an arch distribution
if [[ -f "/etc/arch-release" ]]; then
	echo "Install dependences."
	pushd pacman
	echo "Install native packages."
	sudo pacman -S --needed - < pkglist.txt
	echo "Install foreign packages."
	trizen/trizen -S --needed - < foreignpkglist.txt
	popd
fi

# Install nord-theme for gnome-terminal
if which "gnome-terminal" > /dev/null; then
	echo "Install nord-theme for gnome-terminal."
	./gnome-terminal/nord-gnome-terminal/src/nord.sh
fi

# Install dotfiles
echo "Stow all dotfiles."
stow \
	bash \
	dircolors \
	git \
	sqlite \
	tmux \
	top \
	vim \
	zsh \
	R

# Return to the WD of origin
popd

echo "Your homespace is ready, enjoy!"
