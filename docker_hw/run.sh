#!/bin/bash

if [ "$1" = "build_generator" ]; then
  docker build -t generator:1.0 ./generator
fi

if [ "$1" = "run_generator" ]; then
  docker run --rm -v "$(pwd)/data:/data" generator:1.0
fi

if [ "$1" = "create_local_data" ]; then
  mkdir -p local_data
  python3 generator/generate.py local_data
fi

if [ "$1" = "build_reporter" ]; then
  docker build -t reporter:1.0 ./reporter
fi

if [ "$1" = "run_reporter" ]; then
  docker run --rm -v "$(pwd)/data:/data" reporter:1.0
fi

if [ "$1" = "structure" ]; then
  find . -maxdepth 3
fi

if [ "$1" = "clear_data" ]; then
  rm -f data/*.csv
  rm -f data/*.html
fi

if [ "$1" = "inside_generator" ]; then
  docker run --rm -v "$(pwd)/data:/data" generator:1.0 ls /data
fi

if [ "$1" = "inside_reporter" ]; then
  docker run --rm -v "$(pwd)/data:/data" reporter:1.0 ls /data
fi
