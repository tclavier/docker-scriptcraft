# docker-scriptcraft

It's a [Docker](http://www.docker.com) container for [minecraft]() with
[CanaryMod](http://canarymod.net/) and [ScriptCraft](http://scriptcraftjs.org/)
installed and ready to run.

ScriptCraft is a Minecraft Mod that lets you extend Minecraft using the Javascript Programming Language. ScriptCraft makes modding Minecraft easier. It includes a logo-like "Drone" object that can be used to build complex buildings, roads, villages, even entire cities. It also includes many other features that make modding Minecraft easier.

# Run

To run it launch :

    docker run -p 25565:25565 -p 22:22 -it tclavier/scriptcraft

# Play

To test connect your minecraft client to `minecraft.tcweb.org` and read https://github.com/walterhiggins/ScriptCraft/blob/master/docs/API-Reference.md

# Options

Some options could be pass by environment variables :

* `OPS` : Pseudo of first ops
* `INIT_WORLD` : if this variable is set, all worlds will be removed at startup
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

Make sure you can run `docker` and build

    docker build -t tclavier/scriptcraft .

That will download all require files and build container tclavier/scriptcraft for you. 

