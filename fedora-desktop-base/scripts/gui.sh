#!/usr/bin/env bash
set -ex
sudo dnf groupinstall -y \
  workstation-product-environment

sudo systemctl set-default graphical.target
sudo systemctl enable gdm
