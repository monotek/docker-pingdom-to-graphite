#!/bin/bash

if [ "$1" = 'pingdom-to-graphite' ]; then

    /usr/local/bundle/bin/pingdom-to-graphite init

    sed -i -e "s#YOUR_USERNAME#${PINGDOM_USER}#g" -e "s#YOUR_PASSWORD#${PINGDOM_PASS}#g" -e "s#YOUR_API_KEY#${PINGDOM_APIKEY}#g" /root/.p2g/config.json

    /usr/local/bundle/bin/pingdom-to-graphite init_checks

    if [ "$?" != "0" ]; then
	echo "error getting pingdom checks! are username, password and api key env vars set?"
	exit 1
    fi

    while true; do
	/usr/local/bundle/bin/pingdom-to-graphite update
	sleep 60
    done
fi
