# [bmilcs] arch networking config


##### optional: wifi package

    sudo pacman -S iwd

##### create *.network cfg files

    sudo vim /etc/systemd/network/bm-wifi.conf
    -------------------------------------------------------
    [Match]
    Name=wl*

    [Network]
    DHCP=ipv4

    [DHCP]
    RouteMetric=20

    sudo vim /etc/systemd/network/bm-wired.conf
    -------------------------------------------------------
    [Match]
    Name=enp*

    [Network]
    DHCP=ipv4

    [DHCP]
    RouteMetric=10

##### symlink resolv.conf

    sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

##### enable/start systemd services

    # ETHERNET + WIFI
    sudo systemctl enable {systemd-networkd.service,systemd-resolved.service,iwd.service}
    sudo systemctl start {systemd-networkd.service,systemd-resolved.service,iwd.service}

    # ETHERNET ONLY 
    sudo systemctl enable {systemd-networkd.service,systemd-resolved.service,iwd.service}
    sudo systemctl start {systemd-networkd.service,systemd-resolved.service,iwd.service}

##### configure wifi

- iwctl

      iwctl --passphrase X station INTERFACE connect SSID
      iwctl --passphrase X station wlan0 connect-hidden miller_guest 

      #iwctl
        station wlan0 scan
        station wlan0 get-networks
        known-networks list

##### troubleshooting

- networkctl

      networkctl list
      networkctl forcerenew
      networkctl reload
      networkctl reconfigure

- resolvectl 

      resolvectl status
      resolvectl flush-caches
      resolvectl statistics


