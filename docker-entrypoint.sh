#!/bin/bash
set -e

# For dev check if the gems as installed, if not
# then install them.
if bundle check
then
  bundle install;
fi

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the containers main process (whats set as CMD in the Dockerfile).
exec "$@"
