sudo apt-get install -y git
sudo apt-get install -y cmake-curses-gui
sudo apt-get install -y build-essential
sudo apt-get install -y libboost-all-dev
sudo apt-get install -y libxt-dev
sudo apt-get install -y libbz2-dev
sudo apt-get install -y libqt4-dev
sudo apt-get install -y qt4-default
sudo apt-get install -y qt4-dev-tools
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y libpcap-dev

########################
## Configure and make ##
########################
rm bin
mkdir build
cd build
cmake -DPYTHON_EXECUTABLE:FILEPATH=/usr/bin/python2.7 -DPYTHON_LIBRARY:FILEPATH=/usr/lib/python2.7/config-x86_64-linux-gnu/libpython2.7.so -DPYTHON_INCLUDE_DIR:FILEPATH=/usr/include/python2.7/ -DENABLE_veloview=ON -DUSE_SYSTEM_boost=ON -DUSE_SYSTEM_python=ON -DUSE_SYSTEM_qt=ON ../Superbuild

export QT_SELECT=qt4
make -j4
sudo make install

cd install/lib
sudo cp *.* /usr/lib
cd ..
sudo ldconfig -v
cd ../../

sudo ln -s build/veloview/src/veloview-build/bin bin