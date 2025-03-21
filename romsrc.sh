#!/bin/bash
#test file
#repo init -u https://github.com/LineageOS/android.git -b lineage-20.0 --git-lfs --depth=1
#mkdir -p .repo/local_manifests
#echo '<manifest>
#            <project name="Notkerd69/device_xiaomi_fog-11" path="device/xiaomi/fog" remote="github" revision="lineage-18.1"/>
#            <project name="Asyanx/sea_kernel_xiaomi_sm6225" path="kernel/xiaomi/fog" remote="github" revision="sea-r-oss"/>
#            <project name="Notkerd69/vendor_xiaomi_fog-db" path="vendor/xiaomi/fog" remote="github" revision="lineage-18.1"/>
#            </manifest>' > .repo/local_manifests/roomservice.xml
#git clone --depth=1 -b 11.0 https://github.com/crdroidandroid/android_hardware_xiaomi.git hardware/xiaomi
#git clone https://github.com/Asyanx/sea_kernel_xiaomi_sm6225 -b sea-r-oss --depth 1 ~/android/device/xiaomi/fog
#git clone https://github.com/Notkerd69/device_xiaomi_fog-11 -b lineage-18.1 --depth 1 ~/android/kernel/xiaomi/fog
#git clone https://github.com/Notkerd69/vendor_xiaomi_fog-db -b lineage-18.1 --depth 1 ~/android/vendor/xiaomi/fog
#test crdroid
#repo init -u https://github.com/crdroid-security/android.git -b 11.0 --git-lfs --depth=1
#repo init -u https://github.com/CarbonROM/android.git -b cr-9.0 --git-lfs --depth=1
#wget https://raw.githubusercontent.com/accupara/docker-images/master/aosp/common/resync.sh
#source resync.sh
#git clone --depth=1 -b kila-r-oss https://github.com/Asyanx/sea_kernel_xiaomi_sm6225.git kernel/xiaomi/fog
#git clone --depth=1 -b cr-9.0 https://github.com/SourceLab081/device_xiaomi_fog-11_2.git device/xiaomi/fog
#git clone --depth=1 -b lineage-18.1 https://github.com/develux44/vendor_xiaomi_fog-11.git vendor/xiaomi/fog
#git clone --depth=1 -b 11.0 https://github.com/crdroidandroid/android_hardware_xiaomi.git hardware/xiaomi
#repo init --depth=1 -u https://github.com/accupara/los20 --git-lfs
#repo init --depth=1 -u https://github.com/LineageOS/android -b lineage-21.0 --git-lfs
#repo sync -j3 --force-sync --no-tags --retry=3
repo init --depth=1 -u https://github.com/CarbonROM/android.git -b cr-11.0 --git-lfs
rm -rf .repo/local_manifests
git clone https://github.com/SourceLab081/local_manifests --depth 1 -b cr-11.0 .repo/local_manifests
#git clone https://github.com/SourceLab081/local_manifests --depth 1 -b lineage-18.1 .repo/local_manifests
#repo init --depth=1 --no-repo-verify -u https://github.com/ProjectInfinity-X/manifest -b 15 --git-lfs -g default,-mips,-darwin,-notdefault
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b 15-Inifity-X .repo/local_manifests
#repo init --depth=1 -u https://github.com/HorizonDroidLab/manifest.git -b 14 --git-lfs
#rm -rf .repo/local_manifests && git clone https://github.com/SourceLab081/local_manifests --depth 1 -b 14-HorizonDroidLab .repo/local_manifests
#mkdir -p .repo/local_manifests
#echo '<?xml version="1.0" encoding="UTF-8"?>

#<manifest>

      #  <remote name="fog"
      #          fetch="https://github.com" clone-depth="1" />

     #   <remote name="fog2"
     #           fetch="https://gitlab.com" clone-depth="1" />
        
    #    <remote  name="HorizonDroidLab_udc"
    #       fetch="https://github.com/HorizonDroidLab"
    #       revision="refs/heads/udc"  clone-depth="1" />
                
    #    <!-- Sync trees -->
    #    <project path="device/xiaomi/taoyao-kernel" name="HorizonDroid-Devices/device_xiaomi_taoyao-kernel"  remote="fog" revision="14" />
   #     <project path="device/xiaomi/taoyao" name="HorizonDroid-Devices/device_xiaomi_taoyao" remote="fog" revision="14" />
  #      <project path="vendor/xiaomi/taoyao" name="HorizonDroid-Devices/vendor_xiaomi_taoyao" remote="fog" revision="14" />

 #       <project path="hardware/xiaomi" name="LineageOS/android_hardware_xiaomi" remote="fog" revision="lineage-21" />
        

#</manifest>' > .repo/local_manifests/local_manifest.xml
#mv .repo/local_manifests/local_manifest.xml .repo/local_manifests/pixelstar.xml
