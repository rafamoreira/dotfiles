#!/bin/bash
systemctl enable --now systemd-networkd.service
systemctl enable --now systemd-resolved.service

# to use resolved we need to link /etc/resolv.conf to systemd-resolvd stub
ln -sf ../run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
