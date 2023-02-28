FROM docker.io/chenximao/suseeuler-shim-review:2.1-shimreview

ARG ARCHITECTURE
ENV ARCHITECTURE=${ARCHITECTURE}
COPY rpmmacros /root/.rpmmacros
RUN mkdir -p /root/rpmbuild/SOURCES/
COPY shim /root/rpmbuild/SOURCES/
RUN rpmbuild -ba /root/rpmbuild/SOURCES/shim.spec
RUN mkdir /shim
RUN cd /shim/ && unrpm /root/rpmbuild/RPMS/$ARCHITECTURE/shim-*.$ARCHITECTURE.rpm
RUN pesign --hash --padding --in=/shim/usr/share/efi/$ARCHITECTURE/shim-sel.efi
RUN sha256sum /shim/usr/share/efi/$ARCHITECTURE/shim-sel.efi
