Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries

-------------------------------------------------------------------------------
### What is the link to your tag in a repo cloned from rhboot/shim-review?
-------------------------------------------------------------------------------
https://github.com/parheliamm/shim-review/tree/sel-2.0-shim-20221012

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------
aarch64:
pesign --hash --padding --in ./shim-sel_aarch64.efi
hash: 3d10841538d171b1d2b5c347a1ed6ef107b90d1dda96e4e6493d1c06a3aeb565

sha256sum ./shim-sel_aarch64.efi
cabe5eecbb1d111b510ea4d48062b558676e1781be0095c4e3a5ac79c129084f  ./shim-sel_aarch64.efi

x86_64:
pesign --hash --padding --in=./shim-sel_x86_64.efi
hash: 90527bff2a7cbe7d43e0819c45f759630a93524f5f8a96838da9cf3573fa1827

sha256sum ./shim-sel_x86_64.efi
29bcda7b4ad9f84ba718a5bae3725b4e99d94d63bba4c4e713d85470088a9b59  ./shim-sel_x86_64.efi
