#!/bin/bash
target=$(date +%Y%m%d -d yesterday)
backup_path_cam1=/var/www/html/Frontdoor/$target
backup_path_cam2=/var/www/html/Camera2/$target
backup_path_cam3=/var/www/html/Camera3/$target
backup_dest1=/home/pi/backup/Camera1
backup_dest2=/home/pi/backup/Camera2
backup_dest3=/home/pi/backup/Camera3
dater=$(date +%Y%m%d -d yesterday)
filename1="$backup_dest1$dater.tgz"
filename2="$backup_dest2$dater.tgz"
filename3="$backup_dest3$dater.tgz"

tar --use-compress-program="pigz -k " -cf $filename1 $backup_path_cam1
tar --use-compress-program="pigz -k " -cf $filename2 $backup_path_cam2
tar --use-compress-program="pigz -k " -cf $filename3 $backup_path_cam3
wait
sudo s3cmd put $filename1 s3://mdb-fdcamera
wait
sudo s3cmd put $filename2 s3://mdb-fdcamera
wait
sudo s3cmd put $filename3 s3://mdb-fdcamera
wait 
sudo rm -f *.tgz /home/pi/backup
