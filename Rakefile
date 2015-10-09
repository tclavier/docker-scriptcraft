require 'rake/docker_lib'

directory '.target'

task :download => ['.target/canarymod.jar', '.target/scriptcraft.jar']

file '.target/canarymod.jar' => '.target' do 
  sh "wget --no-check-certificate https://canarymod.net/releases/CanaryMod-1.8.0-1.2.0-RC1.jar -O .target/canarymod.jar"
end

file '.target/scriptcraft.jar' => '.target' do 
  # http://scriptcraftjs.org/download/latest 
  sh "wget http://scriptcraftjs.org/download/latest/scriptcraft-3.1.10/scriptcraft.jar -O .target/scriptcraft.jar"
end

Rake::DockerLib.new("tclavier/scriptcraft") do
end

task test: :build
task prepare: :download

task :clean do
  sh "rm -rf .target"
end
