#! /bin/sh

# DOTFILES Bootstrapping
#
# Sets up symbolic links from the users home folder to this repositorys
# location. It attempts to do so in such a un-opinionated matter as possible,
# by letting this folder mimic the structure of the home folder.
#
# This is heavily inspired by the bootstrap file build by mathiasbynens, at
# https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh

# We cannot use something like 'readlink -e $0' because that doesn't work
# everywhere. This is just a way of finding out where we are currently
# standing.
case $0 in
  /*|~*)
    SCRIPT_INDIRECT="`dirname $0`"
    ;;
  *)
    PWD="`pwd`"
    SCRIPT_INDIRECT="`dirname $PWD/$0`"
    ;;
esac

BASEDIR="`(cd \"$SCRIPT_INDIRECT\"; pwd -P)`"

# Find all files in the base directory, in all subfolders. We will ignore the
# contents of the .git/ folder, as this is a git repository after all, as well
# as all files called bootstrap.sh (to avoid symlinking this folder.)
for fn in $(find -L $BASEDIR \
                 -type f \
                 ! -iname "bootstrap.sh" \
                 ! -iname "README.md" \
                 ! -iname "LICENSE" \
                 ! -path "*/.git/*"); do
  # Make sure to extract the homedir path to this file. This should be relative
  # to the home directory in the same manner as it is relative to this
  # repositorys root directory.
  FILEDIR=`dirname $fn`
  FILE=`basename $fn`
  BASEFILE="$HOME${FILEDIR#$BASEDIR}/$FILE"

  # Remove the any existing file to replace ut by the symlink.
  if [ -f $BASEFILE -o -h $BASEFILE ]; then
    echo "Replacing file: $BASEFILE"
    rm $BASEFILE
  else
    echo "Creating link: $BASEFILE"
  fi

  ln -s $fn $BASEFILE
done
