wget https://dl.google.com/android/repository/platform-tools-latest-linux.zip
cat > ~/.profile << EOF
# add Android SDK platform tools to path
if [ -d "$HOME/platform-tools" ] ; then
    PATH="$HOME/platform-tools:$PATH"
fi
EOF
#git clone https://github.com/akhilnarang/scripts
#cd scripts
#./setup/android_build_env.sh

if [ -d "$HOME/.local/bin" ] ; then
   mkdir -p ~/.local/bin
fi
#export JAVA_TOOL_OPTIONS="-Xms1g -Xmx6g -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp -XX:+UseG1GC -Dfile.encoding=UTF-8"
git config --global user.email "root@localhost"
git config --global user.name "Tester"
git config --global color.ui true
git config --global http.postBuffer 524288000  # Tingkatkan buffer menjadi 500 MB
git config --global http.lowSpeedLimit 0       # Nonaktifkan batas kecepatan minimum
git config --global http.lowSpeedTime 999999   # Tingkatkan waktu low speed
#sudo modprobe zram
#echo 30G | sudo tee /sys/block/zram0/disksize
#sudo mkswap /dev/zram0
#sudo swapon /dev/zram0
#swapon --show
#echo "memory :"
free -h
export DEBIAN_FRONTEND=noninteractive
#echo "restart no" | sudo tee /etc/needrestart/needrestart.conf
sudo apt-get update
sudo apt-get -y upgrade
sudo apt install -y libncurses5 bc openjdk-11-jdk git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev python3 ccache
sudo needrestart -r a
export NINJA_ARGS="-j2"
export MAKEFLAGS += -j2
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/repo
chmod a+x ~/repo
sudo cp -a ~/repo /usr/local/bin/repo
#export USE_CCACHE=1
#export CCACHE_EXEC=/usr/bin/ccache
#ccache -M 50G

df -h >> info.txt
cat /proc/cpuinfo >> info.txt
cat /proc/meminfo >> info.txt
cat info.txt
git clone --depth=1 https://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@github.com/SourceLab081/rombuilderCircleCi 
source rombuilderCircleCi/romsrc.sh
#echo "first attempt"
#rm -rf packages/resources/devicesettings && git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b lineage-18.1 packages/resources/devicesettings
#cd build/soong/ && git fetch https://github.com/masemoel/build_soong_legion-r 11 &&  git cherry-pick b45c5ae22f74f1bdbb9bfbdd06ecf7a25033c78b && git cherry-pick b45c5ae22f74f1bdbb9bfbdd06ecf7a25033c78b && cd ../..
#cd /home/circleci
#source rombuilderCircleCi/checkNrun.sh
#repo sync -j$(nproc --all) --force-sync --no-tags --retry=3 
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)
#repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags --optimized-fetch --prune
#|& tee sync_process20252401_0700.txt
#wget https://raw.githubusercontent.com/GustavoMends/go-up/master/go-up 
#&& source go-up sync_process20252401_0700.txt
#source go-up /proc/config.gz
#wget https://raw.githubusercontent.com/accupara/docker-images/master/aosp/common/resync.sh
#source resync.sh
#source rombuilderCircleCi/checkNrun.sh
#from https://xdaforums.com/t/guide-how-to-build-android-11-with-low-ram.4298483/
#echo "second attempt"
#rm -rf packages/resources/devicesettings && git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b lineage-20.0 packages/resources/devicesettings
#cd build/soong && git fetch https://github.com/masemoel/build_soong_legion-r 11;git cherry-pick b45c5ae22f74f1bdbb9bfbdd06ecf7a25033c78b;git cherry-pick b45c5ae22f74f1bdbb9bfbdd06ecf7a25033c78b
#cd /home/circleci
# Specify heap size for metalava for R
# Reduce initial heap size for java from 2048mb to 1024mb
#git cherry-pick b45c5ae22f74f1bdbb9bfbdd06ecf7a25033c78b

# Tune java compiler flags for low ram systems
# This is needed on systems with 8GB physical ram.
# sets the max heap size for java to 3112mb
#git cherry-pick e020f2130224fbdbec1f83e3adfd06a9764cca87

# soong will be rebuilt the next time you build anything in aosp

# fix device/xiaomi/spes/parts/Android.bp:7:1: "XiaomiParts" depends on undefined module
#rm -rf packages/resources/devicesettings
#git clone https://github.com/LineageOS/android_packages_resources_devicesettings packages/resources/devicesettings
free -h
df -h
echo "envsetup.sh"
source build/envsetup.sh
###source rombuilderCircleCi/checkNrun.sh
#df -h >> info.txt 
#cat /proc/meminfo >> info.txt
#cat info.txt
#breakfast fog
#ALLOW_MISSING_DEPENDENCIES=true
echo "lunch"
#lunch carbon_fog-userdebug
#lunch infinity_fog-userdebug
lunch aosp_fog-userdebug
#lunch lineage_fog-userdebug
#croot
#echo "change file for remove the error"
#source go-up build/soong/java/droiddoc.go
#sed -i '84/4096M/1024M/' build/soong/java/config/config.go
#sed -i '95/-JXmx4096M/-JXmx1024M/' build/soong/java/config/config.go
#sed -i '102/-JXmx4096M/-JXmx1024M/' build/soong/java/config/config.go
#source go-up build/soong/java/config/config.go
echo "core processor = $(nproc --all)"
#mka bacon -j19 |& tee mka_process20252401_0700.txt
#only chek sepolicy
#m nothing
#mmma system/sepolicy 2>&1 | tee build.log
#m system/sepolicy 2>&1 | tee build.log
echo "build the code"
m bacon
#mka bacon
#make carbon -j$(nproc --all)
#source go-up mka_process20252401_0700.txt
#ALLOW_MISSING_DEPENDENCIES=true
#croot
#brunch fog | tee log.txt
