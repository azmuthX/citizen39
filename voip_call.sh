#!/bin/bash
COUNTRY_CODE=$1
MOBILE_NUMBER=$2
linphonecsh dial "${COUNTRY_CODE}${MOBILE_NUMBER}"
