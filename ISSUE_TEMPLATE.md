Confirm the following are included in your repo, checking each box:

 - [x] completed README.md file with the necessary information
 - [x] shim.efi to be signed
 - [x] public portion of your certificate(s) embedded in shim (the file passed to VENDOR_CERT_FILE)
 - [x] binaries, for which hashes are added to vendor_db ( if you use vendor_db and have hashes allow-listed )
 - [x] any extra patches to shim via your own git tree or as files
 - [x] any extra patches to grub via your own git tree or as files
 - [x] build logs
 - [x] a Dockerfile to reproduce the build of the provided shim EFI binaries

*******************************************************************************
### What is the link to your tag in a repo cloned from rhboot/shim-review?
*******************************************************************************
`https://github.com/parheliamm/shim-review/tree/sel-2.1-shim-20230228`

*******************************************************************************
### What is the SHA256 hash of your final SHIM binary?
*******************************************************************************
aarch64:
pesign --hash --padding --in ./shim-sel_aarch64.efi
hash: 7f7409b5892ef2cceaf6b3c49841b9868409ae800396d434cfcb4c6911fda78c
sha256sum ./shim-sel_aarch64.efi
5a18523dce7bfea880ce831727ab9d7e9a63b64325944986e9131789a398526b  ./shim-sel_aarch64.efi

x86_64:
pesign --hash --padding --in=./shim-sel_x86_64.efi
hash: a5f7876e09efe0ede04de0ccfb43b2492c98112e4e99d4545afbdcb183e43b6e
sha256sum ./shim-sel_x86_64.efi
f7a1b26e58217fc4a1dcdf40d6da9223788b09d3ec37c587f51dc7140f2d8874  ./shim-sel_x86_64.efi

*******************************************************************************
### What is the link to your previous shim review request (if any, otherwise N/A)?
*******************************************************************************
https://github.com/rhboot/shim-review/issues/260
