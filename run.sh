date
start=$(date +%s.%N)
df -h
echo "memory :"
free -h
cat /proc/cpuinfo 
cat /proc/meminfo 
echo "core processor = $(nproc --all)" 
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
#https://circleci.com/api/v1.1/project/circleci/BvV3NeJ7vtWW9UHXraZR4R/FaKTY4NeSUknzeMwS3SSmP/271/output/102/0?file=true&allocation-id=67d2cb13d0604c5a377e6ba4-0-build%2FABCDEFGH
df -h
export dirHome=`pwd`
#sudo apt install -y git-core zip
#wget https://github.com/SourceLab081/sfbootstrap/archive/refs/heads/master.zip
#unzip master.zip
#cd sfbootstrap-master
git clone https://github.com/SourceLab081/sfbootstrap
cd sfbootstrap
echo "run the command"
set -x
./sfbootstrap.sh init xiaomi-fog
./sfbootstrap.sh status
ls -al
./sfbootstrap.sh chroot setup
df -h 
ls -al src/hybris-18.1/hybris
ls -al src/hybris-18.1/out
./sfbootstrap.sh sync
 df -h 
ls -al src/hybris-18.1/hybris
ls -al src/hybris-18.1/out
./sfbootstrap.sh build hal
./sfbootstrap.sh build packages
set +x
ls -al src/hybris-18.1/hybris
ls -al src/hybris-18.1/out
df -h
cat /var/tmp/rpm-tmp.*
wget https://github.com/SourceLab081/files/raw/refs/heads/main/go-up
. go-up src/hybris-18.1/droid-hal-fog.log
df -h
