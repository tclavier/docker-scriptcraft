from deliverous/jessie
env DEBIAN_FRONTEND noninteractive
run sed -i -e 's/jessie/sid/g' /etc/apt/sources.list
# run sed -i -e 's/jessie/sid/g' -e 's/ftp.us.debian.org/ftp.debian.nl/g' /etc/apt/sources.list
run apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get clean
run apt-get update && \
    apt-get install -y openjdk-8-jre rsync ssh && \
    apt-get clean
# minecraft
add http://scriptcraftjs.org/download/latest/CanaryMod-1.8.0-1.2.1-SNAPSHOT-shaded.jar /opt/minecraft/canarymod.jar
add http://scriptcraftjs.org/download/extras/mqtt/sc-mqtt.jar /opt/minecraft/sc-mqtt.jar
add http://scriptcraftjs.org/download/latest/scriptcraft-3.1.10/scriptcraft.jar /opt/minecraft/plugins/scriptcraft.jar

run echo "eula=true" > /opt/minecraft/eula.txt
add server.cfg /opt/minecraft/config/server.cfg
add default_NORMAL.cfg /opt/minecraft/config/worlds/default/default_NORMAL.cfg

# a default ssh access to upload js 
add sshd_config /etc/ssh/sshd_config
run rm /etc/nologin
run mkdir -p /opt/minecraft/scriptcraft/players/
run echo "root:minecraft" | chpasswd

add start /start
run chmod +x /start

expose 25565 22
volume ["/minecraft/"]
cmd /start
