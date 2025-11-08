date
start=$(date +%s.%N)
df -h
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
df -h
export dirHome=`pwd`
#sudo apt install -y git-core zip
#wget https://github.com/SourceLab081/sfbootstrap/archive/refs/heads/master.zip
#unzip master.zip
#cd sfbootstrap-master
git clone https://github.com/SourceLab081/sfbootstrap
cd sfbootstrap
echo "run command"
set -x
./sfbootstrap.sh init xiaomi-fog
./sfbootstrap.sh status
ls -al
./sfbootstrap.sh chroot setup
df -h 
ls -al
./sfbootstrap.sh sync
 df -h 
 ls -al
./sfbootstrap.sh build hal
./sfbootstrap.sh build packages
set +x
ls -al
df -h
cat /var/tmp/rpm-tmp.*
cat rpm/droid-hal-fog.spec
wget https://github.com/SourceLab081/files/raw/refs/heads/main/go-up
. go-up src/hybris-18.1/droid-hal-fog.log
. go-up /var/tmp/rpm-tmp.*
df -h