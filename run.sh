date
start=$(date +%s.%N)
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

export JAVA_TOOL_OPTIONS="-Xms4g -Xmx12g -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp -XX:+UseG1GC -Dfile.encoding=UTF-8"
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
export DEBIAN_FRONTEND=noninteractive
#echo "restart no" | sudo tee /etc/needrestart/needrestart.conf
#sudo apt-get update
#sudo apt-get -y upgrade
df -h
sudo apt install -y libncurses5 bc openjdk-11-jdk git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev python3
# ccache
sudo needrestart -r a
#export NINJA_ARGS="-j3"
#export MAKEFLAGS += "-j2"
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/repo
chmod a+x ~/repo
sudo cp -a ~/repo /usr/local/bin/repo
ls -al /dev/
echo "list block"
ls -al /dev/block/
#repo init -u https://github.com/CarbonROM/android.git --depth 1 -b cr-9.0 --git-lfs
#git clone https://github.com/SourceLab081/local_manifests --depth 1 -b cr-9.0 .repo/local_manifests
#repo sync -j$(nproc) --force-sync --no-tags
#rm device/qcom/sepolicy/generic/public/attribute/attributes && wget https://raw.githubusercontent.com/SourceLab081/files/refs/heads/main/attributes && mv attributes device/qcom/sepolicy/generic/public/attribute/
#rm -rf packages/resources/devicesettings && git clone https://github.com/LineageOS/android_packages_resources_devicesettings -b lineage-18.1 packages/resources/devicesettings
#export USE_CCACHE=1
#export CCACHE_EXEC=/usr/bin/ccache
#ccache -M 50G
#mkdir -p .cache/ccache/tmp
set -x
sudo mkdir /test01;sudo mount /dev/nvme0n1p1 /test01
ls -lah /test01
du -hs /test01
df -h
mount
cat /proc/cpuinfo 

#>> info_server.txt
cat /proc/meminfo 
#>> info_server.txt
#df -h >> info_server.txt
echo "core processor = $(nproc --all)" 
#>> info_server.txt
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
#repo init --depth 1 -u https://github.com/GenesisOS-Staging/manifest.git -b verve --git-lfs
#rm -rf .repo/local_manifests && git clone https://gitlab.com/sourceslab062/local_manifests --depth 1 -b 15-GenesisOS .repo/local_manifests
#repo init --depth 1 -u https://git.libremobileos.com/LMODroid/manifest.git -b fifteen --git-lfs
#git clone https://github.com/AmogOS-Rom/android_manifest.git -b fifteen --depth 1 .repo
#repo init -u https://github.com/AmogOS-Rom/android_manifest.git -b fifteen --git-lfs
#rm -rf .repo/local_manifests && git clone https://gitlab.com/sourceslab062/local_manifests --depth 1 -b 15-LMODroid .repo/local_manifests
#repo init --depth 1 -u https://github.com/HorizonDroidLab/manifest.git -b fifteen --git-lfs
#rm -rf .repo/local_manifests && git clone https://gitlab.com/sourceslab062/local_manifests --depth 1 -b 15-HorizonDroidLab .repo/local_manifests
#repo init --depth 1 -u https://github.com/Komodo-OS/manifest -b 15 --git-lfs
#rm -rf .repo/local_manifests && git clone https://gitlab.com/sourceslab062/local_manifests --depth 1 -b 15-Komodo .repo/local_manifests
#repo init --depth=1 -u https://github.com/DroidX-UI/manifest.git -b 15_v2 --git-lfs
#rm -rf .repo/local_manifests && git clone https://gitlab.com/sourceslab062/local_manifests --depth 1 -b 15-DroidX-UI .repo/local_manifests
#repo init --depth 1 -u https://github.com/Miku-UI/manifesto -b Vampire_v3 --git-lfs
#rm -rf .repo/local_manifests && git clone https://gitlab.com/sourceslab062/local_manifests --depth 1 -b 15-Miku-UI .repo/local_manifests
#repo init --depth 1 -u https://github.com/VoltageOS/manifest.git -b 15-qpr2 --git-lfs
#rm -rf .repo/local_manifests && git clone https://gitlab.com/sourceslab062/local_manifests --depth 1 -b 15-VoltageOS .repo/local_manifests
#repo init --depth 1 -u https://github.com/AICP/platform_manifest.git -b v15.0 --git-lfs
#rm -rf .repo/local_manifests && git clone https://gitlab.com/sourceslab062/local_manifests --depth 1 -b 15-aicp .repo/local_manifests
#repo init --depth 1 -u https://github.com/The-Clover-Project/manifest.git -b 16 --git-lfs
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b 16-theCloverProject .repo/local_manifests
#repo init --depth 1 -u https://github.com/The-Clover-Project/manifest.git -b 15-qpr2 --git-lfs
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b 15-theCloverProject .repo/local_manifests
#repo init --depth 1 -u https://github.com/omnirom/android.git -b android-16 --git-lfs
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b 16-omnirom .repo/local_manifests
#repo init --depth 1 -u https://git.halogenos.org/halogenOS/android_manifest.git -b XOS-16.0 --git-lfs
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b 16-c0smicLab .repo/local_manifests
#repo init --depth 1 -u https://github.com/yaap/manifest.git -b sixteen --git-lfs
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b 16-yaap .repo/local_manifests
#repo init --depth 1 -u https://github.com/VoltageOS/manifest.git -b 16 --git-lfs
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b 16-VoltageOS .repo/local_manifests
#repo init --depth 1 -u https://github.com/AtlantisOS/manifest -b 16 --git-lfs 
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b 16-AtlantisOS .repo/local_manifests
df -h
repo init --depth 1 -u https://github.com/SailfishOS-miatoll/android  -b hybris-18.1 --git-lfs --no-clone-bundle
rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b hybris-18.1 .repo/local_manifests
echo "repo sync"
#view the log 
#https://circleci.com/api/v1.1/project/circleci/BvV3NeJ7vtWW9UHXraZR4R/FaKTY4NeSUknzeMwS3SSmP/239/output/102/0?file=true&allocation-id=67d2cb13d0604c5a377e6ba4-0-build%2FABCDEFGH
#change for the next log from 193 to 194 , 196 now

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags 

#repo init -u https://github.com/DirtyUnicorns/android_manifest.git -b r11x
##must be updated with clone list manifest.xml
#repo sync --force-sync -j$(nproc --all)
#repo sync -j6 --force-sync --no-tags --retry=3 
#export JACK_SERVER_VM_ARGUMENTS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx8g"
##Then go into the root of the source folder and type the following:
#./prebuilts/sdk/tools/jack-admin kill-server
#./prebuilts/sdk/tools/jack-admin start-server
#wget https://raw.githubusercontent.com/GustavoMends/go-up/master/go-up 
#cat /etc/issue.net > installed_
#apt list --installed >> installed_
#. go-up  installed_
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
#sign
#mkdir -p vendor/extra
#cd vendor/extra && wget https://github.com/SourceLab081/uploadz/releases/download/v0.0.8/sign.zip && unzip sign.zip && rm sign.zip
#cd ../..

#for yaap
# disable fsgen
#cd build/soong && curl https://gist.githubusercontent.com/bagaskara815/2f26516ef378fe8eae9803749e331a09/raw/fsgen.patch >> fsgen.patch && git am fsgen.patch && rm fsgen.patch && cd ../../
#export TARGET_BOARD_PLATFORM=bengal
# remove other power
#rm -f vendor/qcom/opensource/power/power.xml
df -h
curDir=`pwd`
cd external/chromium-webview;rm Android.mk;ln -s patches/os_pickup.mk Android.mk;cd $curDir;
#cd vendor/qcom/opensource/power/ && wget https://github.com/SourceLab081/uploadz/releases/download/v0.0.2/power.xml
#cd $curDir
#rm -f out/target/product/fog//vendor/etc/vintf/manifest/power.xml
#rm -f /tmp/src/android/out/soong/.temp/target_filesb4_jkj_q/VENDOR/etc/vintf/manifest/power.xml
#end for yaap
#if [ ! -f script_sch2.sh ]; then
#   wget https://github.com/SourceLab081/uploadz/releases/download/v0.0.2/script_sch2.sh
#fi
#. script_sch2.sh

#curDir=`pwd`
#cd kernel/xiaomi/fog && rm -rf KernelSU-Next && curl -LSs "https://raw.githubusercontent.com/KernelSU-Next/KernelSU-Next/next/kernel/setup.sh" | bash - && cd $curDir

#fldr="device/qcom/sepolicy_vndr/legacy-um/generic/vendor/common/"
#wget https://github.com/SourceLab081/uploadz/releases/download/v0.0.2/file.te && mv file.te $fldr
#wget https://github.com/SourceLab081/uploadz/releases/download/v0.0.2/genfs_contexts && mv genfs_contexts $fldr
#wget https://github.com/SourceLab081/uploadz/releases/download/v0.0.2/init_shell.te && mv init_shell.te $fl
### not using new hardware/xiaomi/aidl/sensors 
#wget https://github.com/SourceLab081/uploadz/releases/download/v0.1.3/sens.zip
#wget https://github.com/SourceLab081/uploadz/releases/download/v0.1.3/sensors.sh
#. sensors.sh
#export subject='/C=ID/ST=DKI Jakarta/L=Jakarta/O=Android/OU=Android/CN=rom/emailAddress=craveio0explore@gmail.com'
#for x in releasekey platform shared media networkstack verity otakey testkey sdk_sandbox bluetooth nfc; do \
#    yes "" | ./development/tools/make_key vendor/horizon/signing/keys/$x "$subject"; \
#done

#mv vendor/horizon/release/aconfig/ap4a/com.android.settings.flags vendor/horizon/release/aconfig/bp1a/
#rm -rf vendor/horizon/release/aconfig/ap4a
#mkdir bckp_;cd bckp_
#wget https://raw.githubusercontent.com/SourceLab081/files/refs/heads/main/Android_hz.bp && mv Android_hz.bp ../vendor/horizon/release/aconfig/bp1a/com.android.settings.flags/Android.bp
#wget https://raw.githubusercontent.com/SourceLab081/files/refs/heads/main/Android_hz2.bp && mv Android_hz2.bp ../vendor/horizon/release/aconfig/bp1a/Android.bp
#wget https://raw.githubusercontent.com/SourceLab081/files/refs/heads/main/paths.go && mv paths.go ../build/soong/android/paths.go
#cd ..

#sed -i 's/lineage/horizon/g' vendor/horizon/release/build_config/bp1a.scl 
#sed -i 's/lineage/horizon/g' vendor/horizon/release/build_config/bp1a.textproto
#sed -i 's/lineage/horizon/g' vendor/horizon/release/release_configs/bp1a.textproto
#cat vendor/horizon/release/aconfig/bp1a/Android.bp
#sed -i 's/lineage/horizon/g' vendor/horizon/release/aconfig/bp1a/Android.bp
#cat vendor/horizon/release/aconfig/bp1a/Android.bp
#printf "\nfog" >> horizon-maintainers/devices.list
#rm -rf system/qcom/softap/sdk
#export TARGET_BOARD_PLATFORM=bengal
source build/envsetup.sh
#for komodo a15
#rm -rf hardware/xiaomi/aidl/sensors
export SELINUX_IGNORE_NEVERALLOWS=true
export ALLOW_MISSING_DEPENDENCIES=true
#breakfast fog eng
#lunch carbon_fog-userdebug
#lunch genesis_fog-userdebug
#lunch genesis_fog-ap4a-userdebug
#echo "" > build/soong/java/Android.bp
#sed -i '68s/2048M/1024M/' build/soong/java/config/config.go
#build/soong/soong_ui.bash --make-mode -j2 --skip-make --skip-soong-tests
#m nothing
#echo "After repo sync & before build the code"
df -h
#brunch fog eng
#breakfast fog
#lunch miku_fog-bp1a-userdebug
#m horizon
#m bacon
#mka genesis
#set -x
#lunch komodo_fog-ap4a-userdebug
#mka komodo 
#main focus to check sepolicy maybe need time about 30 minute 
#mmma system/sepolicy -j2 
#make diva
#|| true
#set +x
#2>&1 | tee build.log
#m system/sepolicy 2>&1 | tee build.log
#. build/envsetup.sh
#lunch komodo_ulysse-userdebug
#lunch lineage_fog-userdebug
#only check sepolicy
#breakfast fog
#echo "breakfast/lunch"
#lunch atlantis_fog-bp2a-eng
#lunch yaap_fog-user
#make installclean
#lunch aosp_fog-bp2a-userdebug
breakfast fog userdebug
#lunch aicp_fog-eng
#echo "Breakfast + Build the code"
#brunch fog userdebug
echo "build the code"
make -j$(nproc --all) hybris-hal droidmedia libui_compat_layer libsfplugin_ccodec libbiometry_fp_api
#libbiometry_fp_api
#TARGET_BUILD_GAPPS=true m yaap
#m atlantis
#build full aosp_fog-bp2a-userdebug
#mka bacon -j2
#mka clover -j4 
#mmma system/sepolicy -j2
#m nothing
date
end=$(date +%s.%N)    
runtime=$(python -c "print(${end} - ${start})")
#mmma system/sepolicy -j4 2>&1 | tee build.log
#m system/sepolicy 2>&1 | tee build.log
#echo "build the code"
#m bacon
#mka bacon
#make carbon -j$(nproc --all)
#lunch lineage_ugglite-userdebug
#croot
#mka komodo -j4 
#|& tee mka_compile.txt
#source go-up mka_compile.txt
#ALLOW_MISSING_DEPENDENCIES=true
#croot
#brunch fog | tee log.txt
