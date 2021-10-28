# st
sudo apt install libxcomposite-dev libxft-dev libxcursor-dev libxrandr-dev libxinerama-dev libxi-dev

cd

mkdir .suckless
cd .suckless

git clone https://git.suckless.org/st
cd st
curl https://st.suckless.org/patches/alpha/st-alpha-0.8.2.diff >> st-alpha.patch
curl https://st.suckless.org/patches/nordtheme/st-nordtheme-0.8.2.diff >> nord.patch
git apply st-alpha.patch
&& sudo make clean install


# Mutt
sudo apt install -y cyrus-sasl2-doc mutt
