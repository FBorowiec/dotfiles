git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j$(nproc)
# Optional. This will install the polybar executable in /usr/local/bin
sudo make install

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update
# sudo apt install polybar
sudo apt install rofi papirus-icon-theme
# https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip

sudo apt -y install build-essential git cmake cmake-data pkg-config python3-sphinx python3-packaging libcairo2-dev \
    libxcb1-dev libxcb-util0-dev libxcb-randr0-dev libxcb-composite0-dev python3-xcbgen xcb-proto libxcb-image0-dev \
    libxcb-ewmh-dev libxcb-icccm4-dev
sudo apt -y install libxcb-xkb-dev libxcb-xrm-dev libxcb-cursor-dev libasound2-dev libpulse-dev i3-wm libjsoncpp-dev \
     libmpdclient-dev libcurl4-openssl-dev libnl-genl-3-dev