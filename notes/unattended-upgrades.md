# unattended-upgrades

## Install

```sh
sudo apt install unattended-upgrades apt-listchanges -y
```

## Configure

### `sudo vi /etc/apt/apt.conf.d/20auto-upgrades`

```sh
// Enable the update/upgrade script (0=disable)
APT::Periodic::Enable "1";

// Do "apt-get update" automatically every n-days (0=disable)
APT::Periodic::Update-Package-Lists "1";

// Do "apt-get upgrade --download-only" every n-days (0=disable)
APT::Periodic::Download-Upgradeable-Packages "1";

// Run the "unattended-upgrade" security upgrade script
//  every n-days (0=disabled)
//  Requires the package "unattended-upgrades" and will write
//  a log in /var/log/unattended-upgrades
APT::Periodic::Unattended-Upgrade "1";

// Do "apt-get autoclean" every n-days (0=disable)
APT::Periodic::AutocleanInterval "7";

// Send report mail to root
//     0:  no report             (or null string)
//     1:  progress report       (actually any string)
//     2:  + command outputs     (remove -qq, remove 2>/dev/null, add -d)
//     3:  + trace on
// APT::Periodic::Verbose "2";
```

### `sudo vi /etc/apt/apt.conf.d/50unattended-upgrades`

```sh
Unattended-Upgrade::Origins-Pattern {
  "${distro_id} stable";
  "${distro_id} ${distro_codename}-security";
  "${distro_id} ${distro_codename}-updates";
};

// bmilcs addons ------------------------------

// Automatic reboot:
Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "1:30"; # Optional

// Remove unused dependencies
Unattended-Upgrade::Remove-Unused-Dependencies "true";

// --------------------------------------------
```

### `sudo unattended-upgrade -v -d --dry-run`

- Test configuration with the above command.

### `sudo unattended-upgrade -v -d`

- Perform an actual run

#### Gmail Notifications \* not working

```sh
// Email notifications (recipient)
Unattended-Upgrade::Mail "bmilcsn@gmail.com";

// Specify type of notifications:
Unattended-Upgrade::MailReport "on-change";
Unattended-Upgrade::MailReport "only-on-error";
```

Setup SMTP:

```sh
sudo su
apt install bsd-mailx

vi ~/.mairc

set smtp-use-starttls
set ssl-verify=ignore
set smtp=smtp://smtp.gmail.com:587
set smtp-auth=login
set smtp-auth-user=bmilcsn@gmail.com
set smtp-auth-password=secret
set from="bmilcsn@gmail.com

chmod 400 .mailrc
```
