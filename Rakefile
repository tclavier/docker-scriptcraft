require 'rake/docker_lib'

directory '.target'

task :download => ['.target/canarymod.jar', '.target/scriptcraft.jar','.target/sc-mqtt.jar']

file '.target/canarymod.jar' => '.target' do
  # http://scriptcraftjs.org/download/latest
  sh "wget --no-check-certificate http://scriptcraftjs.org/download/latest/CanaryMod-1.8.0-1.2.1-SNAPSHOT-shaded.jar -O .target/canarymod.jar"
#  sh "wget --no-check-certificate https://canarymod.net/releases/CanaryMod-1.8.0-1.2.0-RC1.jar -O .target/canarymod.jar"
end

file '.target/scriptcraft.jar' => '.target' do 
  # http://scriptcraftjs.org/download/latest 
  sh "wget --no-check-certificate http://scriptcraftjs.org/download/latest/scriptcraft-3.1.10/scriptcraft.jar -O .target/scriptcraft.jar"
end

file '.target/sc-mqtt.jar' => '.target' do
  # http://scriptcraftjs.org/download/extras
  sh "wget --no-check-certificate http://scriptcraftjs.org/download/extras/mqtt/sc-mqtt.jar -O .target/sc-mqtt.jar"
end

Rake::DockerLib.new("tclavier/scriptcraft") do
end

task test: :build
task prepare: :download

task :clean do
  sh "rm -rf .target"
end
