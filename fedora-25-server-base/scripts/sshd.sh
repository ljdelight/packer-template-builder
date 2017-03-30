#!/usr/bin/env bash
set -ex

sudo tee -a /etc/ssh/sshd_config <<EOF
UseDNS no
EOF
