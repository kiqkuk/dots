# SYSTEM LOG - IdeaPad 3 14ITL6 (82H7)

## [2026-04-06] - initial recovery & hardening
### input fix (ghostkey)
- **problem:**  scancode `0x56` (KEY_102ND) spamming.
- **src:**      `~/dots/system/udev/`
- **target:**   `/etc/udev/`
- **verify:**   `sudo udevadm info /dev/input/eventX` | `libinput debug-events` 

---

## [2026-04-07] - networking & security
### network core (iwd & resolved)
- **configs:**
    - `iwd`:    `~/dots/system/iwd/main.conf` -> `/etc/iwd/main.conf` (MAC randomization)
    - `resolved`:   `~/dots/system/systemd/resolved.conf` -> `/etc/systemd/resolved.conf` (DoT)
- **verify:**   `resolvectl status` (Check +DOT) | `iwctl device list`

### kernel & firewall hardening
- **sysctl:**   `~/dots/system/sysctl.d/99-hardening.conf` -> `/etc/sysctl.d/`
- **nftables:** native config (Policy DROP, No SSH)
- **verify:**   `sudo nft list ruleset` | `sudo sysctl --system`

### Desktop Environment (DWL)
- **Repo:** `~/projects/dwl` & `someblocks` & `somebar`
- **Note:** compiled with custom `config.h` and patches.

---

## [2026-04-08] - system stability & optimization
### ghost key fix migrate to service
- **problem:**  udev hwdb can't stop log spam.
- **src:**      `~/dots/system/systemd/system/fix-ghostkey.service` -> `/etc/systemd/system/fix-ghostkey.service`

### initramfs migration (booster)
- **problem:**  `mkinitcpio` build too slow and too bulk (20MB)
- **action:**   install `booster` and configs `/etc/booster.yaml` with `strip: true` and `compression: zstd`
- **result:**   img size 4MB

### migrate to doas
- **config:**   `/etc/doas.conf` with `permit persist :wheel`
- **tweak:**    create custom binary `/usr/local/bin/sudo` to `exec doas "$@"`

### log pam & d-bus cleanup
- **problem:**  log spam `activation request for `org.freedesktop.home1` failed` at login
- **fix:**      commented out (`#`) line `pam_systemd_home.so` on `/etc/pam.d/system-auth`
