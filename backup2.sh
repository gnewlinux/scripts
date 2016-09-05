#!/bin/bash
###########################
#
# Backup
#
###########################

# Arquivos de backup
backup_files="/home /var/spool/mail /etc /root /boot /opt"

# Destino do backup
dest="/mnt/backup"

# Criando arquivo
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Print start status
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup dos arquivos usando tar
tar czf $dest/$archive_file $backup_files

# Print end status
echo
echo "Backup finished"
date

# Lista longa dos arquivos em $dest para checagem.
ls -lh $dest
