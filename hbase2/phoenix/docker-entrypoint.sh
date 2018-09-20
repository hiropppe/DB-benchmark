#!/bin/bash

set -e

# workaround for empty USER
USER=root

if [ -e "/tmp/*.pid" ]; then
    rm /tmp/*.pid
fi

exec "$@"
