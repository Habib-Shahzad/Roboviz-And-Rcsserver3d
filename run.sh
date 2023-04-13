#!/usr/bin/env bash


docker run \
       -ti --rm \
       -p 3200:3200 \
       -p 3100:3100 \
       --name rcssserver3d \
       rcss3d/rcssserver3d