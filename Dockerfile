from debian:sid
env DEBIAN_FRONTEND noninteractive
run sed -e 's/deb.debian.org/debian.mirrors.ovh.net/g' -i /etc/apt/sources.list
run apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get clean
run apt-get update && \
    apt-get install -y openjdk-8-jdk rsync ssh git && \
    apt-get clean
# Spigot (Minecraft server)
add https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar /opt/minecraft/BuildTools.jar
workdir /opt/minecraft/

env MINECRAFT_VERSION=1.13.1
run java -jar BuildTools.jar --rev $MINECRAFT_VERSION .

add http://scriptcraftjs.org/download/latest/scriptcraft-3.2.1/scriptcraft.jar /opt/minecraft/plugins/scriptcraft.jar

run echo "eula=true" > /opt/minecraft/eula.txt
add server.properties /opt/minecraft/server.properties
#add config.yml /opt/minecraft/plugins/scriptcraft/config.yml

# a default ssh access to upload js
add sshd_config /etc/ssh/sshd_config
run mkdir -p /opt/minecraft/scriptcraft/players/
run echo "root:minecraft" | chpasswd

add start /start
run chmod +x /start

expose 25565 22
volume ["/minecraft/"]
cmd /start
