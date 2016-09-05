#!/bin/bash
###########################
#
# Script simples de Backup
# gnew - 2016
# Sugestões e criticas:
# gnewlinux@gmail.com
#
###########################

# Arquivos para backup
backup_files="/etc /boot"

# Destino do backup
dest="/home/gnew"

# Gerando arquivo de backup
day=$(date +%d%m%Y%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Status do backup
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Compactando arquivos
tar -cvzf $dest/$archive_file $backup_files

# Print end status
echo
echo "Fim do Backup!"
date

# Lista longa dos arquivos em $dest para checagem.
ls -lh $dest
