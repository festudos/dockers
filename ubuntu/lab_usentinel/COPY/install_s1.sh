#!/usr/bin/env bash
set -ex
TOKEN_S1='eyJ1cmwiOiAiaHR0cHM6Ly91c2VhMS0zMDAtbmZyLnNlbnRpbmVsb25lLm5ldCIsICJzaXRlX2tleSI6ICJnXzc4OThhNDkxYTM4MTdhN2QifQ=='
apt install ./SentinelAgent_linux_v23_1_2_9.deb && \
/opt/sentinelone/bin/sentinelctl management token set $TOKEN_S1ls
