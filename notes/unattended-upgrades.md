# unattended-upgrades

## Install

```sh
# unattended-upgrades WITH email notification packages (ubuntu 22.04.2)
sudo apt install -y unattended-upgrades apt-listchanges \
                    postfix libsasl2-modules bsd-mailx

# postfix setup:
#   Internet Site
#   local.domain


# unattend-upgrades only
sudo apt install -y unattended-upgrades apt-listchanges
```

## Configure

**`sudo vi /etc/apt/apt.conf.d/20auto-upgrades`**

```sh
APT::Periodic::Enable "1";
APT::Periodic::Unattended-Upgrade "1";

// "apt-get update" every n-days
APT::Periodic::Update-Package-Lists "1";

// "apt-get upgrade --download-only" every n-days
APT::Periodic::Download-Upgradeable-Packages "1";

// "apt-get autoclean" every n-days
APT::Periodic::AutocleanInterval "7";

// email notifications (1: progress report, 2: +command outputs, 3: + trace on)
APT::Periodic::Verbose "2";
```

**`sudo vi /etc/apt/apt.conf.d/50unattended-upgrades`**

```sh
Unattended-Upgrade::Origins-Pattern {
  "${distro_id} stable";
  "${distro_id} ${distro_codename}-security";
  "${distro_id} ${distro_codename}-updates";
};

// Allow ALL Origins
Unattended-Upgrade::Origins-Pattern {
      "origin=*";
};

// --- bmilcs customizations ------------------

Unattended-Upgrade::Automatic-Reboot "true";
Unattended-Upgrade::Automatic-Reboot-Time "1:30";
Unattended-Upgrade::Remove-Unused-Dependencies "true";
Unattended-Upgrade::Mail "bmilcsn@gmail.com";
Unattended-Upgrade::MailReport "on-change"; // OR "only-on-error";

// --------------------------------------------
```

## Gmail Notifications

[Source #1](https://www.linuxbabe.com/ubuntu/automatic-security-update-unattended-upgrades-ubuntu) /
[Source #2](https://www.hackingloops.com/postfix-gmail-smtp-kali-linux/)

**`sudo vi /etc/postfix/main.cf`**

```sh
#
# DELETE relayhost= & inet_interfaces=all
#

relayhost = [smtp.gmail.com]:587
# only send email // not receive
inet_interfaces = loopback-only
# add this to bottom
# outbound relay configurations
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_tls_security_level = may
header_size_limit = 4096000
```

**`sudo vi /etc/postfix/sasl_passwd`**

```sh
[smtp.gmail.com]:587 gmail-address:password
```

Then run:

```sh
sudo postmap /etc/postfix/sasl_passwd
sudo systemctl restart postfix
sudo chmod 0600 /etc/postfix/sasl_passwd /etc/postfix/sasl_passwd.db
echo "this is a test email." | mailx -r madeup@email.com -s hello bmilcsn@gmail.com
```

## Test Runs

```sh
# dry run
sudo unattended-upgrade -v -d --dry-run

# actual run
sudo unattended-upgrade -v -d
```
