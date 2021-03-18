# docker branch

this is a fork of http://zed0.co.uk/clang-format-configurator . It is optimized to work local in docker container. 

## Requirements

 - docker-compose
 - bash

## run

To start run

```
docker-compose up
```

in the source dir. It forwards Port 8080, so connect with a browser to [localhost:8080](http://localhost:8080).

## changes to original

 - added docker-compose.yml and Dockerfile to run all in docker container
 - removed google analytics
 - removed encryption
 - hard-coded parcel-builder to fixed version (cause of bug in actl. version)
 - disabled build-head
 - forced min-version to clang-11 cause of ubunutu-20.04-base-container
 - removed proceed question cause of docker
 - fixed source template url to github
 - replaced bash magic to get versions with javascript node file to parse llvm site with more context(TODO: this should be replaced with github api / git connects to get released versions).
 - git should contain now all stuff needed to build (clang should not be checked out separate).


## clang-format-configurator
Interactively create a clang-format configuration while watching how the changes affect your code.
See it in action at http://zed0.co.uk/clang-format-configurator

## Requirements
All requirements should be available through your package manager:
* [Node.js](https://nodejs.org/en)
* [firejail](https://github.com/netblue30/firejail) (assuming you want to sandbox the process)

## Installation
The setup script will install the various npm and bower dependencies and then download the clang-format binaries and documentation from the [official releases](http://llvm.org/releases/download.html).
If you want to disable some versions, or add new ones, alter the `clang_versions` variable at the top of `setup.sh`
```
chmod u+x setup.sh
./setup.sh
```

## Usage
With Node.js:
```
npm start
```

With firejail:
```
server/launch.sh
```

## History
Version 0.0.3

## Credits
Author: Ben Falconer

## License
MIT
