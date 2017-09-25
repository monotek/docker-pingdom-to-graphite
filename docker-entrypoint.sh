#!/bin/bash

if [ "$1" = 'pingdom-to-graphite' ]; then
    while true; do
	pingdom-to-graphite update
	sleep 60
    done
fi
