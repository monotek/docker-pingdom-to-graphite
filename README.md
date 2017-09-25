# docker-pingdom-to-graphite

container uses: https://github.com/lewg/pingdom-to-graphite

docker run -ti -v /data/.p2g/:/root/.p2g/ monotek/docker-pingdom-to-graphite


Commands:
  pingdom-to-graphite advice               # Gives you some advice about update frequency.
  pingdom-to-graphite backfill [CHECK_ID]  # Work backwards from the oldest check send to graphite, grabbing more historical data.
  pingdom-to-graphite help [COMMAND]       # Describe available commands or one specific command
  pingdom-to-graphite init                 # Create an empty config JSON file if missing.
  pingdom-to-graphite init_checks <regex>  # Add your checks to your config. (Will overwrite existing list.) If regex is supplied will only add matching checks.
  pingdom-to-graphite list                 # List all your available Pingdom checks.
  pingdom-to-graphite probes               # List all the pingdom probes.
  pingdom-to-graphite results [CHECK_ID]   # List results for a specific check. The Pingdom API limits results to 100.
  pingdom-to-graphite update               # Attempt to bring the checks defined in your config file up to date in graphite. If a check has never been polled before it will start with the last 100 checks.

Options:
  -c, [--config=CONFIG]            # The path to your config file.
                                   # Default: ~/.p2g/config.json
  -s, [--state=STATE]              # The path to your state file.
                                   # Default: ~/.p2g/state.json
  -v, [--verbose], [--no-verbose]  # Increase verbosity.
