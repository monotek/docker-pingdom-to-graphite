#!/bin/bash

if [ "$1" = 'pingdom-to-graphite' ]; then

    QUERY_DELAY="${QUERY_DELAY:=300}"

    # create empty configfile - /root/.p2g/config.json
    /usr/local/bundle/bin/pingdom-to-graphite init

    # add replace username, password and apikey in /root/.p2g/config.json
    sed -i -e "s#YOUR_USERNAME#${PINGDOM_USER}#g" -e "s#YOUR_PASSWORD#${PINGDOM_PASS}#g" -e "s#YOUR_API_KEY#${PINGDOM_APIKEY}#g" /root/.p2g/config.json

    # add configured pingdom checks
    /usr/local/bundle/bin/pingdom-to-graphite init_checks "${PD_REGEX}"

    # exit if pingdom cant be accessed
    if [ "$?" != "0" ]; then
	echo "error getting pingdom checks! are username, password and api key env vars set?"
	exit 1
    fi

    while true; do
	/usr/local/bundle/bin/pingdom-to-graphite update
	sleep "${QUERY_DELAY}"
    done

fi
