# onvif-bdr
Backup Script for my ONVIF cameras

I have three ONVIF IP cameras that send snapshots via FTP to my Raspberry Pi.
This script will compress the previous day's screenshots, and then upload it to my Wasabi S3 storage.

Requirements: 

1. Linux
2. S3cmd installed and set up.

Next steps : Need to resolve issue with backups not deleting off the Raspberry Pi storage.
