echo 'Setting up VS Code'
echo '--- --- --- --- ---'
echo 'Installing VS Code'
snap install code
echo 'Setting VS Code config'
cp vscode/settings.json ~/.config/Code/User/settings.json
echo '--- --- --- --- ---'

echo 'Setting up Kitty'
echo '--- --- --- --- ---'
echo 'Installing Kitty'
sudo apt install kitty
echo 'Setting Kitty as default terminal'
sudo update-alternatives --config x-terminal-emulator
echo 'Setting Kitty config'
cp kitty/* ~/.config/kitty/
echo '--- --- --- --- ---'

echo 'Setting up bash'
echo '--- --- --- --- ---'
echo 'Setting bashrc'
cat bashrc/bashrc >> ~/.bashrc
echo '--- --- --- --- ---'
