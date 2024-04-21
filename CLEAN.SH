#!/bin/bash

current_date=$(date +%Y%m%d)

archive_filename="archive_$current_date.tar.gz"

# Archive all files (excluding CLEAN.sh) that are older than the current date
find . -maxdepth 1 -type f ! -name "CLEAN.sh" ! -newermt $(date +%Y-%m-%d) -print0 | tar -czvf "$archive_filename" --null -T -

# Move the archive to the /archive subdirectory
mkdir -p archive
mv "$archive_filename" archive/

# Delete the files that were included in the archive
find . -maxdepth 1 -type f ! -name "CLEAN.sh" ! -newermt $(date +%Y-%m-%d) -delete
