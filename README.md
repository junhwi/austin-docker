# Austin on Docker
https://hub.docker.com/r/junhwi/austin/

The Docker image to run [Austin](https://github.com/kiranlak/austin-sbst), a structural test data generation tool for the C language.

## Dependency

Austin depends on [cil](https://people.eecs.berkeley.edu/~necula/cil/). Source code of cil is included in this image.

## Usage

For more detailed instructions to run Austin, see [here](https://github.com/kiranlak/austin-sbst/tree/master/docs).

## Get Started
```sh
$ docker run -ti -v <your_volume>:/austin/sample junhwi/austin

root@5e9435fc3285:/austin# ls
austin-sbst  cil-1.3.7  run.sh  sample
```
Mount your working directory into `/austin/sample` to use `run.sh`.
`run.sh` is a simple script to run Austin in a single command.

To use it,

1. Use configuration file `/austin/sample/austin.inp`.
2. Set `austinOut = /austin/sample/out/` in your config.

Then,

```sh
# Do preprocessing
root@5e9435fc3285:/austin# gcc -P -E sample/list.c > sample/list.pp.c
# Run Austin
root@5e9435fc3285:/austin# ./run.sh sample/list.pp.c insert
```
