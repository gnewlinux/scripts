sudo dpkg --add-architecture i386  && sudo apt-get update
sudo apt-get install build-essential pkg-config qt4-qmake libqt4-dev libavformat-dev libavcodec-dev libavutil-dev libswscale-dev libasound2-dev libpulse-dev libjack-jackd2-dev libgl1-mesa-dev libglu1-mesa-dev libx11-dev libxfixes-dev libxext-dev libxi-dev g++-multilib libx11-6 libxext6 libxfixes3 libxfixes3:i386 libglu1-mesa:i386

cd /usr/lib/i386-linux-gnu
sudo ln -s libGL.so.1 libGL.so
sudo ln -s libGLU.so.1 libGLU.so
sudo ln -s libX11.so.6 libX11.so
sudo ln -s libXext.so.6 libXext.so
sudo ln -s libXfixes.so.3 libXfixes.so
sudo ldconfig

cd /usr/local/src
sudo git clone https://github.com/MaartenBaert/ssr
cd ssr

sudo vim simple-build-and-install

# Exclua os ifs que validam o usuário Root

./simple-build-and-install
