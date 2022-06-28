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
`https://github.com/parheliamm/shim-review/tree/sel-2.0-shim-20220704

-------------------------------------------------------------------------------
### What is the SHA256 hash of your final SHIM binary?
-------------------------------------------------------------------------------
aarch64:
pesign --hash --padding --in usr/share/efi/aarch64/shim-sel.efi 
hash: bde31b7ef3c81f7eccbce167057b6675160113fbaaca313108da1848b9556cfd

sha256sum ./shim-sel_aarch64.efi
220af16cb67ea54e34263bfc8d50275a21d66e80036b4cb5516d145c8ffd5809  shim-sel_aarch64.efi


x86_64:
pesign --hash --padding --in=./shim-sel_x86_64.efi
hash: a87485be25d3f27b5dfa17390491537b979cefc8483c0fb08da7dfdc81f04bf8

sha256sum ./shim-sel_x86_64.efi 
4dae5b2f24eb0e5d7a96194694fc5a62c1dfb6809f3d1162c86bfe900cc65308  shim-sel_x86_64.efi
