# This provides some functions that create and manipulate git repositories


# Creates a git repo named "proj" and a git repo named "upstream" in
# the directory named in the first argument
create_repo() {
  mkdir "$1"
  pushd "$1" > /dev/null
  git init -q
  popd > /dev/null
}


# In the git repo specified by $1, creates an empty file named $2
# and commits it with an optional commit message.
commit_new_file() {
  pushd "$1" > /dev/null
  touch "$2"
  git add "$2"
  msg="commit_new_file: create $2"
  [ "x$3" != "x" ] && msg="$3"
  git commit -q -m "$msg"
  popd > /dev/null
}
 
