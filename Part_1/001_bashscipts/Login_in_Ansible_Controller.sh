#!/bin/bash

# Load config values
source vars.conf

eval $(ssh-agent)
ssh-add  ../002_mykey/mykey
ssh -A ubuntu@"$IPANSIBLECONTROLLER"    