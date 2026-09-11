#!/bin/sh
# Микросегментация на уровне роутера OpenWrt
# 1. Запрет маршрутизации торрент-сервера через eBPF/TPROXY (Zero-copy bypass)
nft insert rule inet fw4 mangle_prerouting ip saddr 192.168.1.127 counter return

# 2. Защита от DNS Amplification атак со стороны WAN
nft insert rule inet fw4 input_wan udp dport 53 counter drop
nft insert rule inet fw4 input_wan tcp dport 53 counter drop
