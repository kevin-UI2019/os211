#!/bin/bash
# Written by Cicak bin Kadal
# Tue 13 Oct 2020 10:37:14 AM WIB

FILES="my*.txt my*.sh"
SHA="SHA256SUM"

# Remove old SHA256 files
echo "rm -f $SHA $SHA.asc"
rm -f $SHA $SHA.asc

# Create a new SHA256SUM file from output
echo "sha256sum $FILES > $SHA"
sha256sum $FILES > $SHA

# Checksum using the SHA256SUM file before
echo "sha256sum -c $SHA"
sha256sum -c $SHA

# Make a signature w/ gpg to SHA256SUM.asc file
echo "gpg -o $SHA.asc -a -sb $SHA"
gpg -o $SHA.asc -a -sb $SHA

# Verify the file w/ existing key
echo "gpg --verify $SHA.asc $SHA"
gpg --verify $SHA.asc $SHA

exit 0

