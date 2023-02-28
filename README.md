This repo is for review of requests for signing shim.  To create a request for review:

- clone this repo
- edit the template below
- add the shim.efi to be signed
- add build logs
- add any additional binaries/certificates/SHA256 hashes that may be needed
- commit all of that
- tag it with a tag of the form "myorg-shim-arch-YYYYMMDD"
- push that to github
- file an issue at https://github.com/rhboot/shim-review/issues with a link to your tag
- approval is ready when the "accepted" label is added to your issue

Note that we really only have experience with using GRUB2 on Linux, so asking
us to endorse anything else for signing is going to require some convincing on
your part.

Here's the template:

*******************************************************************************
### What organization or people are asking to have this signed?
*******************************************************************************
SUSE, https://suse.com/

*******************************************************************************
### What product or service is this for?
*******************************************************************************
SUSE Euler Linux 2.1

*******************************************************************************
### What's the justification that this really does need to be signed for the whole world to be able to boot it?
*******************************************************************************
SUSE is one of the major vendors in the Linux ecospace and this shim is a part
of a commercial support offering advertised publicly.

Yunche is a SUSE company that is focused on China local market.
SUSE Euler Linux is developed by SUSE China and will be sold mainly in China.

*******************************************************************************
### Why are you unable to reuse shim from another distro that is already signed?
*******************************************************************************
They don't boot our grub.

*******************************************************************************
### Who is the primary contact for security updates, etc.?
The security contacts need to be verified before the shim can be accepted. For subsequent requests, contact verification is only necessary if the security contacts or their PGP keys have changed since the last successful verification.

An authorized reviewer will initiate contact verification by sending each security contact a PGP-encrypted email containing random words.
You will be asked to post the contents of these mails in your `shim-review` issue to prove ownership of the email addresses and PGP keys.
*******************************************************************************
- Name: Chenxi Mao
- Position: Security Engineer
- Email address: chenxi.mao@yuncheos.com
- PGP key fingerprint: A47A 1943 6129 0EE4 563E  0E32 962F E514 2997 A88D

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

Above key has two uids in https://keyserver.ubuntu.com/
1. chenxi.mao@suse.com
2. chenxi.mao@yuncheos.com

The chenxi.mao@suse.com has been signed by other SUSE colleagues.

*******************************************************************************
### Who is the secondary contact for security updates, etc.?
*******************************************************************************
- Name: Kai Liu
- Position: Project Manager Security
- Email address: kai.liu@yuncheos.com
- PGP key fingerprint: 9832 2ECD DEB3 0DF9 E740 FE15 6057 319B 4FD8 E00C

(Key should be signed by the other security contacts, pushed to a keyserver
like keyserver.ubuntu.com, and preferably have signatures that are reasonably
well known in the Linux community.)

Above key has two uids in https://keyserver.ubuntu.com/

1. kai.liu@suse.com
2. kai.liu@yuncheos.com

The kai.liu@suse.com has been signed by other SUSE colleagues.

*******************************************************************************
### Were these binaries created from the 15.7 shim release tar?
Please create your shim binaries starting with the 15.7 shim release tar file: https://github.com/rhboot/shim/releases/download/15.7/shim-15.7.tar.bz2

This matches https://github.com/rhboot/shim/releases/tag/15.7 and contains the appropriate gnu-efi source.

*******************************************************************************
Yes, we are using shim 15.7 release tarball
https://github.com/rhboot/shim/releases/download/15.7/shim-15.7.tar.bz2

*******************************************************************************
### URL for a repo that contains the exact code which was built to get this binary:
*******************************************************************************
Our build service isn't publicly available. The code is shim 15.7 + the patches described below and added here

*******************************************************************************
### What patches are being applied and why:
*******************************************************************************
We use 15.7 shim +

- opensuse-shim-arch-independent-names.patch
- opensuse-shim-change-debug-file-path.patch
- opensuse-shim-bsc1177315-verify-eku-codesign.patch
- opensuse-remove_build_id.patch
- opensuse-shim-disable-export-vendor-dbx.patch
- backport-shim-Enable-the-NX-compatibility-flag-by-default.patch


*******************************************************************************
### If shim is loading GRUB2 bootloader what exact implementation of Secureboot in GRUB2 do you have? (Either Upstream GRUB2 shim_lock verifier or Downstream RHEL/Fedora/Debian/Canonical-like implementation)
*******************************************************************************
Downstream RHEL/Fedora/Debian/Canonical like implementation

*******************************************************************************
### If shim is loading GRUB2 bootloader and your previously released shim booted a version of grub affected by any of the CVEs in the July 2020 grub2 CVE list, the March 2021 grub2 CVE list, the June 7th 2022 grub2 CVE list, or the November 15th 2022 list, have fixes for all these CVEs been applied?

* CVE-2020-14372
* CVE-2020-25632
* CVE-2020-25647
* CVE-2020-27749
* CVE-2020-27779
* CVE-2021-20225
* CVE-2021-20233
* CVE-2020-10713
* CVE-2020-14308
* CVE-2020-14309
* CVE-2020-14310
* CVE-2020-14311
* CVE-2020-15705
* CVE-2021-3418 (if you are shipping the shim_lock module)

* CVE-2021-3695
* CVE-2021-3696
* CVE-2021-3697
* CVE-2022-28733
* CVE-2022-28734
* CVE-2022-28735
* CVE-2022-28736
* CVE-2022-28737

* CVE-2022-2601
* CVE-2022-3775
*******************************************************************************
Yes

*******************************************************************************
### If these fixes have been applied, have you set the global SBAT generation on your GRUB binary to 3?
*******************************************************************************
Yes

*******************************************************************************
### Were old shims hashes provided to Microsoft for verification and to be added to future DBX updates?
### Does your new chain of trust disallow booting old GRUB2 builds affected by the CVEs?
*******************************************************************************
This is our first shim submission for SUSE Euler Linux 2.1

The old product(SUSE Euler Linux 2.0) shim review https://github.com/rhboot/shim-review/issues/260 submission needs to be modified to enable the NX compatibility flag by default and then submit a new review request.

So there is no old shims signed by Microsoft.

*******************************************************************************
### If your boot chain of trust includes a Linux kernel:
### Is upstream commit [1957a85b0032a81e6482ca4aab883643b8dae06e "efi: Restrict efivar_ssdt_load when the kernel is locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1957a85b0032a81e6482ca4aab883643b8dae06e) applied?
### Is upstream commit [75b0cea7bf307f362057cc778efe89af4c615354 "ACPI: configfs: Disallow loading ACPI tables when locked down"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=75b0cea7bf307f362057cc778efe89af4c615354) applied?
### Is upstream commit [eadb2f47a3ced5c64b23b90fd2a3463f63726066 "lockdown: also lock down previous kgdb use"](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eadb2f47a3ced5c64b23b90fd2a3463f63726066) applied?
*******************************************************************************
All patches are applied

*******************************************************************************
### Do you build your signed kernel with additional local patches? What do they do?
*******************************************************************************
SUSE Euler actively backports features and bugfixes.

*******************************************************************************
### If you use vendor_db functionality of providing multiple certificates and/or hashes please briefly describe your certificate setup.
### If there are allow-listed hashes please provide exact binaries for which hashes are created via file sharing service, available in public with anonymous access for verification.
*******************************************************************************
We don't use this

*******************************************************************************
### If you are re-using a previously used (CA) certificate, you will need to add the hashes of the previous GRUB2 binaries exposed to the CVEs to vendor_dbx in shim in order to prevent GRUB2 from being able to chainload those older GRUB2 binaries. If you are changing to a new (CA) certificate, this does not apply.
### Please describe your strategy.
*******************************************************************************
We are not reusing any previously used CA, this is our first submission

*******************************************************************************
### What OS and toolchain must we use to reproduce this build?  Include where to find it, etc.  We're going to try to reproduce your build as closely as possible to verify that it's really a build of the source tree you tell us it is, so these need to be fairly thorough. At the very least include the specific versions of gcc, binutils, and gnu-efi which were used, and where to find those binaries.
### If the shim binaries can't be reproduced using the provided Dockerfile, please explain why that's the case and what the differences would be.
*******************************************************************************
Build can be replicated with the provided Dockerfile.

aarch64:

podman build -f Dockerfile --no-cache --build-arg ARCHITECTURE=aarch64

x86_64:

podman build -f Dockerfile --no-cache --build-arg ARCHITECTURE=x86_64

*******************************************************************************
### Which files in this repo are the logs for your build?
This should include logs for creating the buildroots, applying patches, doing the build, creating the archives, etc.
*******************************************************************************
build_x86_64.log

build_aarch64.log

*******************************************************************************
### What changes were made since your SHIM was last signed?
*******************************************************************************
No Shim was ever signed to us.

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
5a18523dce7bfea880ce831727ab9d7e9a63b64325944986e9131789a398526b  shim-sel_aarch64.efi
f7a1b26e58217fc4a1dcdf40d6da9223788b09d3ec37c587f51dc7140f2d8874  shim-sel_x86_64.efi


*******************************************************************************
### How do you manage and protect the keys used in your SHIM?
*******************************************************************************
The key is installed in a machine with restricted physical and system access.
Shim binaries do not include private portions of the key.

*******************************************************************************
### Do you use EV certificates as embedded certificates in the SHIM?
*******************************************************************************
Yes

*******************************************************************************
### Do you add a vendor-specific SBAT entry to the SBAT section in each binary that supports SBAT metadata ( grub2, fwupd, fwupdate, shim + all child shim binaries )?
### Please provide exact SBAT entries for all SBAT binaries you are booting or planning to boot directly through shim.
### Where your code is only slightly modified from an upstream vendor's, please also preserve their SBAT entries to simplify revocation.
*******************************************************************************
On shim, we have:

```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
shim,3,UEFI shim,shim,1,https://github.com/rhboot/shim
shim.sel,1,SUSE Euler Linux,shim,15.7-1.se21,mailto:euler-security@suse.com
```

On grub2, we have:

```
sbat,1,SBAT Version,sbat,1,https://github.com/rhboot/shim/blob/main/SBAT.md
grub,3,Free Software Foundation,grub,2.06,https://www.gnu.org/software/grub/
grub.sel,1,SUSE Euler Linux,grub2,2.06-17.se21,mailto:euler-security@suse.com
```

-------------------------------------------------------------------------------
### Which modules are built into your signed grub image?
*******************************************************************************
grub-core all_video boot cat configfile echo true font gfxmenu gfxterm gzio halt iso9660 jpeg minicmd normal part_apple part_msdos part_gpt password password_pbkdf2 png reboot search search_fs_uuid search_fs_file search_label sleep test video fat loadenv chain efifwsetup efinet linuxefi btrfs ext2 xfs jfs reiserfs tftp http efinet luks gcry_rijndael gcry_sha1 gcry_sha256 mdraid09 mdraid1x lvm serial

*******************************************************************************
### What is the origin and full version number of your bootloader (GRUB or other)?
*******************************************************************************
grub2-2.06-17.se21

*******************************************************************************
### If your SHIM launches any other components, please provide further details on what is launched.
*******************************************************************************
It doesn't

*******************************************************************************
### If your GRUB2 launches any other binaries that are not the Linux kernel in SecureBoot mode, please provide further details on what is launched and how it enforces Secureboot lockdown.
*******************************************************************************
N/A

*******************************************************************************
### How do the launched components prevent execution of unauthenticated code?
*******************************************************************************
GRUB and kernel are patched to enforce Secure Boot.

*******************************************************************************
### Does your SHIM load any loaders that support loading unsigned kernels (e.g. GRUB)?
*******************************************************************************
No

*******************************************************************************
### What kernel are you using? Which patches does it includes to enforce Secure Boot?
*******************************************************************************
5.10+

Module signing / secure boot
patches.suse/KEYS-Make-use-of-platform-keyring-for-module-signatu.patch

Lock down functions for UEFI secure boot
patches.suse/0001-security-lockdown-expose-a-hook-to-lock-the-kernel-down.patch
patches.suse/0002-efi-Add-an-EFI_SECURE_BOOT-flag-to-indicate-secure-boot-mode.patch
patches.suse/0003-efi-Lock-down-the-kernel-if-booted-in-secure-boot-mode.patch
patches.suse/0004-efi-Lock-down-the-kernel-at-the-integrity-level-if-b.patch

Using the hash in MOKx to blacklist kernel module, FATE#316531
patches.suse/0001-MODSIGN-do-not-load-mok-when-secure-boot-disabled.patch
patches.suse/0001-efi-add-a-function-to-convert-the-status-code-to-a-s.patch
patches.suse/0002-efi-show-error-messages-only-when-loading-certificat.patch
patches.suse/0003-MODSIGN-load-blacklist-from-MOKx.patch
patches.suse/0004-MODSIGN-checking-the-blacklisted-hash-before-loading.patch

Hibernation Signature Verification FATE#316350
patches.suse/0001-security-create-hidden-area-to-keep-sensitive-data.patch
patches.suse/0002-hibernate-avoid-the-data-in-hidden-area-to-be-snapsh.patch
patches.suse/0003-x86-KASLR-public-the-function-for-getting-random-lon.patch
patches.suse/0005-efi-generate-secret-key-in-EFI-boot-environment.patch
patches.suse/0006-efi-allow-user-to-regenerate-secret-key.patch
patches.suse/0007-PM-hibernate-encrypt-hidden-area.patch
patches.suse/0008-PM-hibernate-Generate-and-verify-signature-for-snaps.patch
patches.suse/0009-PM-hibernate-prevent-EFI-secret-key-to-be-regenerate.patch
patches.suse/0010-PM-hibernate-a-option-to-request-that-snapshot-image.patch
patches.suse/0011-PM-hibernate-require-hibernate-snapshot-image-to-be-.patch

*******************************************************************************
### Add any additional information you think we may need to validate this shim.
*******************************************************************************
**grub2 & kernel source code**

grub2:

https://github.com/parheliamm/shim-review/blob/sel-2.1-shim-20230228/grub2.tar.gz

kernel:

https://github.com/suseEuler/kernel/tree/SEL-2.1
