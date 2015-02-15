from deliverous/jessie
env DEBIAN_FRONTEND noninteractive
run apt-get update && \
    apt-get install -y openjdk-7-jre && \
    apt-get clean
add https://s3.amazonaws.com/Minecraft.Download/versions/1.8.1/minecraft_server.1.8.1.jar /opt/minecraft/minecraft_server.jar
add http://canarymod.net/download/file/fid/309 /opt/minecraft/CanaryMod-1.8.0-1.2.0-RC1.jar
add http://scriptcraftjs.org/download/latest/scriptcraft-3.1.1/scriptcraft.jar /opt/minecraft/scriptcraft.jar
run echo "eula=true" > /opt/minecraft/eula.txt
expose 25565
cmd java -Xmx1024M -jar minecraft_server.jar nogui
