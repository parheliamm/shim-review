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
https://github.com/parheliamm/shim-review/tree/sel-2.0-shim-20220909

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------
aarch64:
pesign --hash --padding --in usr/share/efi/aarch64/shim-sel.efi 
hash: 8e481e52d65c42fec6a30d113bce5aa3111e21c6258f4c53b7ef3f9ecd0b92c1

sha256sum ./shim-sel_aarch64.efi
875566dc61e22d3a2b6b3b7da7041fd07a8b85223e52b7cef1a403320d0ccab6  shim-sel_aarch64.efi

x86_64:
pesign --hash --padding --in=./shim-sel_x86_64.efi
hash: 59428c8741644e1e10a80b1355cb0fbaa9d616ccc3d8fd636d9559e40b258c0d

sha256sum ./shim-sel_x86_64.efi
f0526c33694f5d1945b1e628e5e5a47eaa9c4145fb2b7f3ceca251c515baf0fc  shim-sel_x86_64.efi
