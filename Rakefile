require 'rake/docker_lib'

directory '.target'

task :download => ['.target/minecraft_server.jar', '.target/canarymod.jar', '.target/scriptcraft.jar']

file '.target/minecraft_server.jar' => '.target' do 
  sh "wget https://s3.amazonaws.com/Minecraft.Download/versions/1.8.1/minecraft_server.1.8.1.jar -O .target/minecraft_server.jar"
end

file '.target/canarymod.jar' => '.target' do 
  sh "wget http://canarymod.net/download/file/fid/309 -O .target/canarymod.jar"
end

file '.target/scriptcraft.jar' => '.target' do 
  sh "wget http://scriptcraftjs.org/download/latest/scriptcraft-3.1.1/scriptcraft.jar -O .target/scriptcraft.jar"
end

Rake::DockerLib.new("tclavier/scriptcraft") do
end

task test: :build
task prepare: :download

