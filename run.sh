echo "compile kernel start"

git config --global user.email "tester@localhost"
git config --global user.name "Tester"
git config --global color.ui true
git config --global http.postBuffer 524288000  # Tingkatkan buffer menjadi 500 MB
git config --global http.lowSpeedLimit 0       # Nonaktifkan batas kecepatan minimum
git config --global http.lowSpeedTime 999999   # Tingkatkan waktu low speed

sudo modprobe zram
echo 30G | sudo tee /sys/block/zram0/disksize
sudo mkswap /dev/zram0
sudo swapon /dev/zram0

sudo apt install -y libc++-dev build-essential git bc kmod cpio flex cpio libncurses5-dev bison libssl-dev libelf-dev curl zip unzip 
# curl https://github.com/SourceLab081/files/raw/refs/heads/main/build_kernel.sh | bash
wget https://github.com/SourceLab081/files/raw/refs/heads/main/build_kernel.sh
 #export kernel_src="--depth=1 -b fog-new https://github.com/SourceLab081/greenforce"
 export kernel_src="--depth=1 -b fog https://github.com/SourceLab081/hybris_kernel"
 export config="vendor/fog-hybris_defconfig"
 export variant="ubt"
 export protonNLos="yes" KSU_NEXT="no"
  
. build_kernel.sh

echo "end"
