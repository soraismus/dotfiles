# some way to access each (source,destination) as like an array?
# see "directory_history_index" and "directory_history_length" in .bash_exports
function record_directory {
  echo $1>>~/.bash_dir_history
}

function record_and_change_directory {
  cd $1
  echo $1>>~/.bash_dir_history
}

function clear_.bash_dir_history {
  echo >~/.bash_dir_history
}

# 16 June 2013
function err_handle1 {
  status=$?

  if [[ $status -ne 2 && $status -ne 126 && $status -ne 127 ]]; then
    return
  fi

  # Inelegant pipeline but better method is unknown.
  # 'fc -n -l -1' doesn't always have the command yet.
  # '!!' doesn't work from inside functions.
  # BASH_COMMAND gets confused by functions like ls().
  lastcmd=$(history | tail -1 | sed 's/^ *[0-9]* *//')

  # split a string into components
  read cmd args <<< "$lastcmd"

  if [[ -e $cmd ]]; then
    if [[ -d $cmd ]]; then
      cd $cmd
    fi
  fi
}

function err_handle {
  err_handle1
} 2> /dev/null
# Trap errors.
trap 'err_handle' ERR

# 30 June 2013
function ruby_grep {
  temp=/home/theo/TLC/ruby-2.0.0-p195
  ls $temp/*.[ch] $temp/include/*.[ch] $temp/include/ruby/*.[ch] | xargs grep $1 | less
}

# 13 July 2013
#function webstart {
#  echo "<p><a href="$1">$2</a>" >>/home/theo/docs/FirefoxStartPage/start.html
#}

# 5 October 2013
function cdl { cd $1; ls; }

# 6 October 2013
function mcd { mkdir $1; cd $1; }

# 11 October 2013
function encrypt { gpg -ac -no-options "$1"; }

function decrypt { gpg -no-options "$1"; }

# 11 October 2013
###############################
# FAHD SHARIFF'S BASH PROFILE #
###############################

#kill a process by name
pskill()
{
if [ -z $1 ]; then
echo -e \e[0;31;1mUsage: pskill [processName]\e[m;
else
ps -au $USER | grep -i $1 |awk {print kill -9 $1}|sh
fi
}

#jump to a directory
jd()
{
if [ -z $1 ]; then
echo -e \e[0;31;1mUsage: jd [directory]\e[m;
else
findresults=( $(find . -type d -name $1) )
count=${#findresults[@]}
if [ $count = 1 ]; then
 file=${findresults[0]}
 cd $file
else
 if [ $count = 0 ]; then
    echo No such directory
    else echo Ambiguous: $count directories found
 fi
fi
unset findresults
unset count
fi
}

#display directory tree structure
#tree()
#{
#echo -e \033[1;35m
#
#(cd ${1-.} ; pwd)
#find ${1-.} -print | sort -f | sed \
#\
#-e s,^${1-.},, \
#e /^$/d \
#-e s,[^/]*/\([^/]*\)$,\ |-->\1, \
#-e s,[^/]*/, | ,g
#
#echo -e \033[0m
#}

#mkdir and cd combined
#mkcd()
#{
#if [ -z $1 ]; then
#echo -e \e[0;31;1mUsage: mkcd [directory]\e[m;
#else
#if [ -d $1 ]; then
# echo Changed to $1.;
# cd $1;
#else
# mkdir $1;
# echo Created $1;
# cd $1;
#fi;
#fi
#}

# 15 October 2013
#function findstr {
#  rgrep -l '$1' . | less
#}

# 22 October 2013
# awk should print $2; however, does bash interpret this as
# an argument from the commandline to bash or from the stream to awk?
function slink {
  ln -s "$( whereis "$1" | awk '{print $2}' )" "$1__$2"
	echo "$( whereis "$1" | awk '{print $2}' ) has been linked to $1__$2"
}

# 27 November 2013
function inode {
  if [ -z "$1" ]; then
	  echo "This function requires an argument"
		exit 1;
	fi
  echo "$( ls -iL "$1" | sed 's/ .*//' )"
}

# 29 November 2013
function getEnv {
  echo "$( echo "$1" )"
}

function to {
  # Dereference "$MARKPATH/$1" and set to TGT
  TGT="$( ls -l "$MARKPATH/$1" 2>/dev/null | awk '{print $11}' )"
	
	if [ -z "$TGT" ]; then
	  echo "No such mark: $1"
		return
	fi

	# check if the string $TGT has a dollar sign
	if echo $TGT | grep \\$ >/dev/null; then

	  # strip the dollar sign off
	  TGT2="$( echo $TGT | sed 's/\$//' )"

		# Double indirection by way of the Bash construct ${!...}
		# Double indirection is necessary since the variable `TGT2`
		# is used rather than the reference of `TGT2`.
		cd -L ${!TGT2} 2>/dev/null || echo "Error occurred."

  else
		# The following preserves $MARKPATH at the prompt,
		# and this favors succinctness.
		cd -L "$MARKPATH/$1"
	fi
}

function m {
  eval "$@" | less
}

# Sun Dec  1 18:04:35 EST 2013
function revert {
  LEAF_PATH="$PWD"
	ABBREV_PATH="$( echo "$LEAF_PATH" | cut -d'/' -f1-5 )"
	LEAF="$( echo "$LEAF_PATH" | cut -d'/' -f6- )"
	RESTORED_PATH="$( ls -l "$ABBREV_PATH" | awk '{print $11}' )"
	FULL_PATH="${RESTORED_PATH}/${LEAF}"
	if echo "$ABBREV_PATH" | grep ".marks" &>/dev/null; then
		cd "$FULL_PATH"
	fi
}

function back {
  revert
  for i in `seq 1 $1`; do
    cd ..
  done
}

# Tue Dec  3 17:59:22 EST 2013
function togglePrompt {
  if [[ "$PS1" =~ w ]]; then
	  PS1="$(echo "$PS1" | sed 's/w/W/g')"
	else
	  PS1="$(echo "$PS1" | sed 's/W/w/g')"
	fi
}

# Fri Dec 27 15:32:56 EST 2013
# jpalardy
function tad {
  local ts=$(date +%s)
	local d="$HOME/.throw-away/$ts"
	mkdir -p $d
	(cd $d; bash)
	rm -r $d
}

# Wed Jan 15 01:01:39 EST 2014
function prompt_command {

  # Remember where we are:
	pwd > ~/.lastdir

  # Record new directory on change.
	newdir=`pwd`
	if [ ! "$LASTDIR" = "$newdir" ]; then

		# Matthew Might here calls 'markdir.pl'

		# List contents.
		ls -Ft1 | head -4 | tr "\\n" " "; echo
	fi

	export LASTDIR=$newdir
}

# Mon Oct 20 12:41:03 EDT 2014
function bmgrep {
	SEARCHTERM="*$1*"
  find "$TAGPATH" -type d -name "$SEARCHTERM" | awk 'BEGIN {FS="/"} {print $NF}'
}
