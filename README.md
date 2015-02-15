# docker-scriptcraft

It's a [Docker](http://www.docker.com) container for [minecraft]() with [CanaryMod](http://canarymod.net/) and [ScriptCraft](http://scriptcraftjs.org/) installed and ready to run.

# Build

To build it, clone :

    git clone https://github.com/tclavier/docker-scriptcraft.git

Install ruby dependency

    cd docker-scriptcraft
    bundle install

And build

    rake build

That will download all require files and build container for you. 

To run it launch :

    docker run -p 25565:25565 tclavier/scriptcraft
