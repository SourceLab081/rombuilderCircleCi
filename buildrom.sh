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
repo init -u https://github.com/LineageOS/android.git -b lineage-18.1 --git-lfs
mkdir -p .repo/local_manifests
echo '<manifest>
            <project name="Notkerd69/device_xiaomi_fog-11" path="device/xiaomi/fog" remote="github" revision="lineage-18.1"/>
            <project name="Asyanx/sea_kernel_xiaomi_sm6225" path="kernel/xiaomi/fog" remote="github" revision="sea-r-oss"/>
            <project name="https://github.com/Notkerd69/vendor_xiaomi_fog-db" path="vendor/xiaomi/fog" remote="github" revision="lineage-18.1"/>
            </manifest>' > .repo/local_manifests/roomservice.xml
#git clone https://github.com/Asyanx/sea_kernel_xiaomi_sm6225 -b sea-r-oss --depth 1 ~/android/device/xiaomi/fog
#git clone https://github.com/Notkerd69/device_xiaomi_fog-11 -b lineage-18.1 --depth 1 ~/android/kernel/xiaomi/fog
#git clone https://github.com/Notkerd69/vendor_xiaomi_fog-db -b lineage-18.1 --depth 1 ~/android/vendor/xiaomi/fog
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle
source build/envsetup.sh
breakfast fog

export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
croot
launch lineage_fog-userdebug
mka bacon -j8
#brunch fog | tee log.txt
