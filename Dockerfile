from deliverous/jessie
env DEBIAN_FRONTEND noninteractive
run apt-get update && \
    apt-get install -y openjdk-7-jre rsync && \
    apt-get clean
add canarymod.jar /opt/minecraft/
add scriptcraft.jar /opt/minecraft/plugins/

run echo "eula=true" > /opt/minecraft/eula.txt
add server.cfg /opt/minecraft/config/server.cfg
add default_NORMAL.cfg /opt/minecraft/config/worlds/default/default_NORMAL.cfg

add start /start
run chmod +x /start

expose 25565
volume ["/minecraft/"]
cmd /start
