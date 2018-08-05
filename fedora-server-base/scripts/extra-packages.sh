#!/usr/bin/env bash
set -ex

sudo dnf update -y

sudo dnf install -y \
  python \
  python-dnf
