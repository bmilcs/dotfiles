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

#### Gmail Notifications

[Source #1](https://www.linuxbabe.com/ubuntu/automatic-security-update-unattended-upgrades-ubuntu)
[Source #2](https://www.hackingloops.com/postfix-gmail-smtp-kali-linux/)

```sh
// Email notifications (recipient)
Unattended-Upgrade::Mail "bmilcsn@gmail.com";

// Specify type of notifications:
Unattended-Upgrade::MailReport "on-change";
Unattended-Upgrade::MailReport "only-on-error";
```

Setup SMTP:

```sh
# ubuntu 22.04.2
sudo apt install postfix libsasl2-modules bsd-mailx
# postfix setup:
#   Internet Site
#   local.domain

sudo vi /etc/postfix/main.cf

  relayhost = [smtp.gmail.com]:587

  # only send email // not receive
  inet_interfaces = all
  inet_interfaces = loopback-only

  # add this to bottom
  # outbound relay configurations
  smtp_sasl_auth_enable = yes
  smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
  smtp_sasl_security_options = noanonymous
  smtp_tls_security_level = may
  header_size_limit = 4096000

sudo vi /etc/postfix/sasl_passwd

  [smtp.gmail.com]:587 gmail-address:password

sudo postmap /etc/postfix/sasl_passwd
sudo systemctl restart postfix
sudo chmod 0600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db

echo "this is a test email." | mailx -r madeup@email.com -s hello realaddy@gmail.com
```
