require 'rake/docker_lib'

directory '.target'

task :download => ['.target/canarymod.jar', '.target/scriptcraft.jar']

file '.target/canarymod.jar' => '.target' do 
  sh "wget http://canarymod.net/download/file/fid/309 -O .target/canarymod.jar"
end

file '.target/scriptcraft.jar' => '.target' do 
  # http://scriptcraftjs.org/download/latest 
  sh "wget http://scriptcraftjs.org/download/latest/scriptcraft-3.1.3/scriptcraft.jar -O .target/scriptcraft.jar"
end

Rake::DockerLib.new("tclavier/scriptcraft") do
end

task test: :build
task prepare: :download

task :clean do
  sh "rm -rf .target"
end
