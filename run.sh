#!/bin/bash
#
# Script to run Austin in one command.
#
# Written in 2017 by Junhwi Kim <junhwi.kim23@gmail.com>
set -e

DIRNAME="$(dirname "$1")"
DIR="$(cd "$DIRNAME" && pwd)"
FILENAME="$(basename "$1")"

function print_usage() {
  echo "Usage: run.sh <target_file_path> <target_function_name>"
}

if [[ -z $1 || -z $2 ]]
then
  print_usage
  exit
fi

if [ -f /austin/sample/austin.inp ]
then
  cd /austin/austin-sbst/AustinOcaml
  ./austin -i -fut $2 -conf /austin/sample/austin.inp $DIR/$FILENAME

  cd /austin/sample/out
  gcc -c austin_instrumented.c
  g++ -o sut austin_instrumented.o -L/austin/austin-sbst/AustinLib -lAustinLib -ldl -lm

  cd /austin/austin-sbst/AustinOcaml
  time ./austin -sut /austin/sample/out/sut -conf /austin/sample/austin.inp
  else
  echo "/austin/sample/austin.inp is not found."
fi
