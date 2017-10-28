#!/bin/bash

mix local.hex --force
mix local.rebar --force
mix deps.get

( cd assets && npm install )

exec "$@"
