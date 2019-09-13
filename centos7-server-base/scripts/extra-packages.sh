#!/usr/bin/env bash
set -ex

sudo yum -y update

sudo yum -y install \
  python \
  python-dnf
