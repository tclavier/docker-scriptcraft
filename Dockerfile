from deliverous/jessie
env DEBIAN_FRONTEND noninteractive
run apt-get update && \
    apt-get install -y openjdk-7-jre && \
    apt-get clean
add minecraft_server.jar /opt/minecraft/
add canarymod.jar /opt/minecraft/
add scriptcraft.jar /opt/minecraft/plugins/

workdir /opt/minecraft/
run echo "eula=true" > /opt/minecraft/eula.txt

expose 25565
cmd /usr/bin/java -Xmx1024M -jar canarymod.jar
