echo -e "Installing font..."
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

echo -e "Installing nerd fonts..."
curl -sS https://webinstall.dev/nerdfont | bash
curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
curl -fLo "Hack Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf
curl -flo "MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -flo "MesloLGS NF Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -flo "MesloLGS NF Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -flo "MesloLGS NF Bold Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
curl -fLo "SourceCodePro-Black.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-Black.ttf
curl -fLo "SourceCodePro-BlackItalic.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-BlackItalic.ttf
curl -fLo "SourceCodePro-Bold.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-Bold.ttf
curl -fLo "SourceCodePro-BoldItalic.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-BoldItalic.ttf
curl -fLo "SourceCodePro-ExtraLight.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-ExtraLight.ttf
curl -fLo "SourceCodePro-ExtraLightItalic.ttf " https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-ExtraLightItalic.ttf
curl -fLo "SourceCodePro-Italic.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-Italic.ttf
curl -fLo "SourceCodePro-Light.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-Light.ttf
curl -fLo "SourceCodePro-LightItalic.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-LightItalic.ttf
curl -fLo "SourceCodePro-Medium.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-Medium.ttf
curl -fLo "SourceCodePro-MediumItalic.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-MediumItalic.ttf
curl -fLo "SourceCodePro-Regular.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-Regular.ttf
curl -fLo "SourceCodePro-SemiBold.ttf" https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-SemiBold.ttf
curl -fLo "SourceCodePro-SemiBoldItalic.ttf " https://github.com/google/fonts/tree/main/ofl/sourcecodepro/SourceCodePro-SemiBoldItalic.ttf

# Source code pro font
sudo fc-cache -f -v

sudo apt install fonts-powerline
