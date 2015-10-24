# docker-scriptcraft

It's a [Docker](http://www.docker.com) container for [minecraft]() with
[CanaryMod](http://canarymod.net/) and [ScriptCraft](http://scriptcraftjs.org/)
installed and ready to run.

# Run

To run it launch :

    docker run -p 25565:25565 -p 22:22 -it tclavier/scriptcraft

# Options

Some options could be pass by environment variables :

* `INIT_WORLD` : if this variable is set, all worlds will be removed at startup
* `OPS` : Pseudo of first ops
* `ONLINE_MODE` : true or false, option to enable account verification
* `WORLD_TYPE` : FLAT by default
* `GENERATE_STRUCTURES` : true or false, not used in FLAT world

I have enabled a volume: /minecraft, to persist world

For exemple : 

    docker run -p 25565:25565 -it -e OPS=FooBar -e ONLINE_MODE=false -v /tmp/minecraft:/minecraft tclavier/scriptcraft

# Classroom plugin

First ops can activate scripting in online console with 

    /jsp classroom on

or directly in server console by 

    jsp classroom on 

The ssh port is available to upload scripts in players directories only in
sftp, the default credentials are : login `root` and password `minecraft`.
Details about this functionality are available on [classroom-plugin
documentation](https://github.com/walterhiggins/ScriptCraft/blob/master/docs/API-Reference.md#classroom-plugin).

# Deliverous

You can find a file named Deliverous. It must be update with your IP to deploy
this container on [Deliverous](http://deliverous.com) plate-forme.

# Build

If you whant to build it, for exemple to tune your world, clone it :

    git clone https://github.com/tclavier/docker-scriptcraft.git

Install ruby environment

    brew install rbenv-bundler ruby-build wget
    rbenv install 2.0.0-p481
    rbenv local 2.0.0-p481

Install dependencies

    cd docker-scriptcraft    
    bundle install
    
Make sure you can run `docker`

And build

    bundle exec rake build

That will download all require files and build container tclavier/scriptcraft for you. 
