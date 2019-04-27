sudo apt-get install gnome-tweaks -y

ln -s ~/dotfiles/files/gtk.css ~/.config/gtk-3.0/gtk.css

# Remove App Close Button
gsettings set org.gnome.desktop.wm.preferences button-layout ''

# Swap Caps Lock and Escape
gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"

cd /tmp

wget https://extensions.gnome.org/extension-data/dynamic-panel-transparencyrockon999.github.io.v29.shell-extension.zip

unzip dynamic-panel-transparencyrockon999.github.io.v29.shell-extension.zip -d $HOME/.local/share/gnome-shell/extensions/

