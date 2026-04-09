echo "compile kernel start"
set -x
git config --global user.email "tester@localhost"
git config --global user.name "Tester"
set +x

sudo modprobe zram
echo 30G | sudo tee /sys/block/zram0/disksize
sudo mkswap /dev/zram0
sudo swapon /dev/zram0

# wget -O AndroidOne-fog-OTA-20260103-1217.zip https://phoenixnap.dl.sourceforge.net/project/dv-work/rom/AndroidOne-fog-OTA-20260103-1217.zip?viasf=1
#wget https://github.com/SourceLab081/files/raw/refs/heads/main/uploadToGithub.sh
#. uploadToGithub.sh AndroidOne-fog-OTA-20260103-1217.zip
sudo apt install -y libc++-dev build-essential git bc kmod cpio flex cpio libncurses5-dev bison libssl-dev libelf-dev curl zip unzip 
#curl https://github.com/SourceLab081/files/raw/refs/heads/main/build_kernel.sh | bash
wget https://github.com/SourceLab081/files/raw/refs/heads/main/build_kernel.sh
#export kernel_src="--depth=1 -b fog-new https://github.com/SourceLab081/greenforce"
#export kernel_src="--depth=1 -b fog https://github.com/SourceLab081/hybris_kernel"
#export kernel_src="--depth=1 -b fog https://github.com/online0code/halium_kernel"
#export kernel_src="--depth=1 -b main-a16-sm8250-base-ksun-susfs https://github.com/SourceLab081/sm6225-main" 
#main-a16-sm8250-base
#main-a16-sm8250-base-ksun-susfs 
export kernel_src="--depth=1 -b peta-fog https://github.com/SourceLab081/mrsrimar22"

# bpf_gf-fog https://github.com/SourceLab081/greenforce 
#export config="vendor/fog-hybris_defconfig-sfos"
export config="vendor/fog-perf_defconfig"
export variant="peta-fog"
export eva="no" proton="yes" KSUN_SUSFS="no" fromFile="no"
 # circleci 401
 #wget https://github.com/SourceLab081/uploadz/releases/download/v0.2.2/hybris_kernel_origFog-src.zip
 #export file_src="hybris_kernel_origFog-src.zip"

. build_kernel.sh


 echo "end"
