
###########################################################################
#
# cd-mkdir()
#
# cd to a directory. If it doesn't exist, ask to create it
#
# NOTE: This function uses 'chdir' intentionally instead of 'cd' because
# I'm aliasing 'cd' to this function. Using 'cd' here would result in
# some infinite recursion madness
#
function cd-mkdir() {

  # Special cases (no arg, "-", ".", "..")
  [[ $# -eq 0 ]] && chdir && return
  [[ $1 = "-" || $1 = "." || $1 = ".." ]] && chdir "$1" && return

  # File exists as either a regular file or directory
  [[ -f "$1" ]] && echo "$1 is a file, not a directory..." && return
  [[ -e "$1" ]] && (chdir "$1"; return)

  # File does not exist
  read -q "answer?Directory $1 does not exist. Create it [y/N]? "
  [[ $answer = "y" ]] && mkdir "$1" && chdir "$1"

  # Newline for cleanliness
  echo ""   
}
