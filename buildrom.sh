echo "Build Started."
cd ~/
wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
cat > ~/.profile << EOF
# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi
EOF
cd ~/
git clone https://github.com/akhilnarang/scripts
cd scripts
./setup/android_build_env.sh
mkdir -p ~/android
if [ -d "$HOME/.local/bin" ] ; then
   mkdir -p ~/.local/bin
fi
git config --global user.email "root@localhost"
git config --global user.name "Tester"
git config --global color.ui true
git config --global http.postBuffer 524288000  # Tingkatkan buffer menjadi 500 MB
git config --global http.lowSpeedLimit 0       # Nonaktifkan batas kecepatan minimum
git config --global http.lowSpeedTime 999999   # Tingkatkan waktu low speed

cd ~/android
git clone https://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@github.com/SourceLab081/rombuilderCircleCi --depth 1
source rombuilderCircleCi/romsrc.sh
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle
source build/envsetup.sh
#breakfast fog
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
lunch lineage_fog-userdebug
#croot
#mka bacon -j8
#croot
brunch fog | tee log.txt
