#!/usr/bin/env bash
set -e

ROUTER_IP=$(ip route | awk '/^default/ {print $3}')
[ -z "$ROUTER_IP" ] && exit 1

ping -c 1 -W 2 "$ROUTER_IP" >/dev/null 2>&1
