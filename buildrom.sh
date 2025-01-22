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
#git clone https://github.com/akhilnarang/scripts
#cd scripts
#./setup/android_build_env.sh
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
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C0BA5CE6DC6315A3
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*
sudo apt-get update
sudo apt install -y openjdk-11-jdk git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev
export NINJA_ARGS="-j2"
export MAKEFLAGS += -j2
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/repo
chmod a+x ~/repo
sudo cp -a ~/repo /usr/local/bin/repo
#cd ~/android
df -h >> info.txt
cat /proc/cpuinfo >> info.txt
cat /proc/meminfo >> info.txt
cat info.txt
git clone --depth=1 https://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@github.com/SourceLab081/rombuilderCircleCi 
source rombuilderCircleCi/romsrc.sh
source rombuilderCircleCi/checkNrun.sh
#repo sync -j2 --force-sync --no-tags --retry=3
wget https://raw.githubusercontent.com/accupara/docker-images/master/aosp/common/resync.sh
source resync.sh
source rombuilderCircleCi/checkNrun.sh
#from https://xdaforums.com/t/guide-how-to-build-android-11-with-low-ram.4298483/
cd build/soong
git fetch https://github.com/masemoel/build_soong_legion-r 11

# Specify heap size for metalava for R
# Reduce initial heap size for java from 2048mb to 1024mb
git cherry-pick b45c5ae22f74f1bdbb9bfbdd06ecf7a25033c78b

# Tune java compiler flags for low ram systems
# This is needed on systems with 8GB physical ram.
# sets the max heap size for java to 3112mb
git cherry-pick e020f2130224fbdbec1f83e3adfd06a9764cca87

# soong will be rebuilt the next time you build anything in aosp
cd ../..
source build/envsetup.sh
source rombuilderCircleCi/checkNrun.sh
df -h >> info.txt 
cat /proc/meminfo >> info.txt
cat info.txt
#breakfast fog
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G
lunch lineage_fog-userdebug
#croot
mka bacon -j8
#croot
#brunch fog | tee log.txt
