#!/bin/sh

curl -s -H "X-CLIENT-TYPE: android-phone" -H "X-CLIENT-VERSION: 2.9.4-rc2" -H "X-Pipejump-Auth: $1" -H "X-Futuresimple-Token: $1" -H "X-Futuresimple-Api-Token: $1" $2 | python -mjson.tool
