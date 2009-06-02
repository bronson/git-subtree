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
 

# creates a repository named proj that will contain the subtree and
# a repository named upstream that is intended to be a subtree.
set_up_a_repo_and_one_upstream() {
  create_repo "$dir/proj"
  commit_new_file "$dir/proj" "tempfile"
  create_repo "$dir/upstream"
  commit_new_file "$dir/upstream" "upstream-1"
}
