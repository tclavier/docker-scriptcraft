# docker-scriptcraft

It's a [Docker](http://www.docker.com) container for [minecraft]() with [CanaryMod](http://canarymod.net/) and [ScriptCraft](http://scriptcraftjs.org/) installed and ready to run.


# Run

To run it launch :

    docker run -p 25565:25565 -it tclavier/scriptcraft

# Options

Some options could be pass by environement variable : 

* `OPS` : Pseudo of first ops
* `ONLINE_MODE` : true or false, option to enable account verification
* `WORLD_TYPE` : FLAT by default
* `GENERATE_STRUCTURES` : true or false, not used in FLAT world

I have enable a volume : /minecraft, to persit world

For exemple : 

    docker run -p 25565:25565 -it -e OPS=FooBar -e ONLINE_MODE=false -v /tmp/minecraft:/minecraft tclavier/scriptcraft


# Build

If you whant to build it, for exemple to tune default world, clone it :

    git clone https://github.com/tclavier/docker-scriptcraft.git

Install dependencies

    cd docker-scriptcraft
    bundle install

And build

    rake build

That will download all require files and build container tclavier/scriptcraft for you. 
