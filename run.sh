wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
cat > ~/.profile << EOF
# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi
EOF

if [ -d "$HOME/.local/bin" ] ; then
   mkdir -p ~/.local/bin
fi

#export JAVA_TOOL_OPTIONS="-Xms4g -Xmx12g -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp -XX:+UseG1GC -Dfile.encoding=UTF-8"
git config --global user.email "tester@localhost"
git config --global user.name "Tester"
git config --global color.ui true
git config --global http.postBuffer 524288000  # Tingkatkan buffer menjadi 500 MB
git config --global http.lowSpeedLimit 0       # Nonaktifkan batas kecepatan minimum
git config --global http.lowSpeedTime 999999   # Tingkatkan waktu low speed
sudo modprobe zram
echo 18G | sudo tee /sys/block/zram0/disksize
sudo mkswap /dev/zram0
sudo swapon /dev/zram0
swapon --show
echo "memory :"
free -h
free -h >> info_server.txt
uname -a >> info_server.txt
df -h
export DEBIAN_FRONTEND=noninteractive
#echo "restart no" | sudo tee /etc/needrestart/needrestart.conf
sudo apt-get update
sudo apt-get -y upgrade
sudo apt install -y libncurses5 bc openjdk-11-jdk git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev python3
# ccache
sudo needrestart -r a
#export NINJA_ARGS="-j3"
#export MAKEFLAGS += "-j2"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/repo
chmod a+x ~/repo
sudo cp -a ~/repo /usr/local/bin/repo
#repo init -u https://github.com/CarbonROM/android.git --depth 1 -b cr-9.0 --git-lfs
#git clone https://github.com/SourceLab081/local_manifests --depth 1 -b cr-9.0 .repo/local_manifests
#repo sync -j$(nproc) --force-sync --no-tags
#rm device/qcom/sepolicy/generic/public/attribute/attributes && wget https://raw.githubusercontent.com/SourceLab081/files/refs/heads/main/attributes && mv attributes device/qcom/sepolicy/generic/public/attribute/
#rm -rf packages/resources/devicesettings && git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b lineage-18.1 packages/resources/devicesettings
#export USE_CCACHE=1
#export CCACHE_EXEC=/usr/bin/ccache
#ccache -M 50G
#mkdir -p .cache/ccache/tmp
cat /proc/cpuinfo >> info_server.txt
cat /proc/meminfo >> info_server.txt
df -h >> info_server.txt
echo "core processor = $(nproc --all)" >> info_server.txt
#source go-up info_server.txt;
#make carbon -j$(nproc) |& tee mka_process.txt
#for filename in out/target/product/fog/*.zip;do source go-up $filename;done
#repo init -u https://github.com/Komodo-OS/manifest --depth 1 -b 12.1  --git-lfs
#repo init --depth=1 -u https://github.com/CarbonROM/android.git -b cr-11.0 --git-lfs
#mkdir -p .repo/local_manifests
#echo '<?xml version="1.0" encoding="UTF-8"?>

#<manifest>

#        <remote  name="github2"
#        fetch="https://github.com/" />

#        <project path="vendor/xiaomi/ulysse" name="riceDroid-Devices/android_vendor_xiaomi_ulysse" remote="github2" revision="12.1" />
#        <project path="device/xiaomi/ulysse" name="online0code/android_device_xiaomi_ulysse" remote="github2" revision="kmd-12.1" />
#        <project path="kernel/xiaomi/msm8937" name="riceDroid-Devices/android_kernel_xiaomi_msm8937"  remote="github2" revision="12.1" />
#        <project path="device/xiaomi/msm8937-common" name="riceDroid-Devices/android_device_xiaomi_msm8937-common" remote="github2" revision="12.1" />#
#        <project path="vendor/xiaomi/msm8937-common" name="riceDroid-Devices/android_vendor_xiaomi_msm8937-common" remote="github2" revision="12.1" />

#</manifest>' > .repo/local_manifests/local_manifest.xml
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b cr-11.0 .repo/local_manifests
repo init --depth 1 -u https://github.com/GenesisOS/manifest.git -b verve --git-lfs
rm -rf .repo/local_manifests && git clone https://gitlab.com/sourceslab062/local_manifests --depth 1 -b 15-GenesisOS .repo/local_manifests
repo sync -j4 --force-sync --no-tags --retry=3
#repo init -u https://github.com/DirtyUnicorns/android_manifest.git -b r11x
##must be updated with clone list manifest.xml
#repo sync --force-sync -j$(nproc --all)
#repo sync -j6 --force-sync --no-tags --retry=3 
#export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx8g"
##Then go into the root of the source folder and type the following:
#./prebuilts/sdk/tools/jack-admin kill-server
#./prebuilts/sdk/tools/jack-admin start-server
#wget https://raw.githubusercontent.com/GustavoMends/go-up/master/go-up 
#&& source go-up sync_process20252401_0700.txt
#source go-up build.log
#wget https://raw.githubusercontent.com/accupara/docker-images/master/aosp/common/resync.sh
#mkdir bckp_;cd bckp_
#wget https://github.com/SourceLab081/files/raw/refs/heads/main/30.0.ignore.cil && mv 30.0.ignore.cil ../system/sepolicy/private/compat/30.0/30.0.ignore.cil
#wget https://github.com/SourceLab081/files/raw/refs/heads/main/31.0.ignore.cil && mv 31.0.ignore.cil ../system/sepolicy/private/compat/31.0/31.0.ignore.cil
#wget https://github.com/SourceLab081/files/raw/refs/heads/main/32.0.ignore.cil && mv 32.0.ignore.cil ../system/sepolicy/private/compat/32.0/32.0.ignore.cil
#cd ..
#cp system/sepolicy/private/compat/30.0/30.0.ignore.cil system/sepolicy/prebuilts/api/33.0/private/compat/30.0/30.0.ignore.cil
#cp system/sepolicy/private/compat/31.0/31.0.ignore.cil system/sepolicy/prebuilts/api/33.0/private/compat/31.0/31.0.ignore.cil
#cp system/sepolicy/private/compat/32.0/32.0.ignore.cil system/sepolicy/prebuilts/api/33.0/private/compat/32.0/32.0.ignore.cil
source build/envsetup.sh
#lunch carbon_fog-userdebug
#lunch genesis_fog-userdebug
lunch genesis_fog-ap4a-userdebug
#echo "" > build/soong/java/Android.bp
#sed -i '68s/2048M/1024M/' build/soong/java/config/config.go
#build/soong/soong_ui.bash --make-mode -j2 --skip-make --skip-soong-tests
#m nothing
echo "After repo sync & before build the code"
df -h
mka genesis
#set -x
#mmma system/sepolicy -j2 || true
#set +x
#2>&1 | tee build.log
#m system/sepolicy 2>&1 | tee build.log
#. build/envsetup.sh
#lunch komodo_ulysse-userdebug
#lunch carbon_fog-userdebug
#only chek sepolicy
#m nothing
#mmma system/sepolicy -j4 2>&1 | tee build.log
#m system/sepolicy 2>&1 | tee build.log
#echo "build the code"
#m bacon
#mka bacon
#make carbon -j$(nproc --all)
#lunch lineage_ugglite-userdebug
#croot
#mka komodo -j4 |& tee mka_compile.txt
#source go-up mka_compile.txt
#ALLOW_MISSING_DEPENDENCIES=true
#croot
#brunch fog | tee log.txt
