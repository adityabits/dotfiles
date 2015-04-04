#! /usr/bin/env bash

# Copies all files in src that are absent/old in dest to dest
backup_add ()
{
  local src=$1
  local dest=$2
  
  local files=`ls -a $src`
  local file=""

  for file in $files; do
    if [ "$file" == "." -o "$file" == ".." ]; then
      continue
    fi
    local full_src="$src/$file"
    local full_dest="$dest/$file"
    if [ -d "$full_src" ]; then
      # First ensure that directory exists in dest
      if ! [ -e "$full_dest" ]; then
        echo "Copying directory $full_dest"
        cp -r "$full_src" "$full_dest"
      else
        backup_add "$full_src" "$full_dest"
      fi
    else
      if [ "$full_src" -nt "$full_dest" ]; then
        echo "copying $full_src to $full_dest"
        cp "$full_src" "$full_dest"
      fi
    fi
  done
}

# Deletes all files in dest that are not in src
backup_prune ()
{
  local src=$1
  local dest=$2
  
  local files=`ls -a $dest`
  local file=""

  for file in $files; do
    if [ "$file" == "." -o "$file" == ".." ]; then
      continue
    fi

    local full_src="$src/$file"
    local full_dest="$dest/$file"
    # let full_dest exist only if full_src exists
    if ! [ -e "$full_src" ]; then
      echo "Delete $full_dest"
      rm -rf "$full_dest"
    else
      if [ -d "$full_dest" ]; then
        backup_prune "$full_src" "$full_dest"
      fi
    fi
  done
}


IFS_backup=$IFS
IFS=$(echo -en "\n\b")

if [ $# -ne 3 ]; then
  echo "Illegal number of arguments"
fi

case $1 in
  -a)
    backup_add $2 $3;;
  -c)
    backup_add $2 $3
    backup_prune $2 $3;;
  -p)
    backup_prune $2 $3;;
  -m)
    echo "Not yet coded";;
esac
IFS=$IFS_backup
