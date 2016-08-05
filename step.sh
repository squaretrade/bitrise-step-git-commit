#!/bin/bash

# exit if a command fails
set -e

# --- Debug
#files_to_commit="testdata/fileout.txt testdata/fileout2.txt"
#commit_message='added some data'
#is_dry_run=true
#set -x

# --- Required parameters
if [ -z "${files_to_commit}" ] ; then
  echo " [!] Missing required input: files_to_commit"
  exit 1
fi

for file in $files_to_commit
do
  if [ ! -f "${file}" ] ; then
    echo " [!] File doesn't exist: ${file}"
    exit 1
  fi
done

if [ -z "${commit_message}" ] ; then
  echo " [!] Missing required input: commit_message"
  exit 1
fi

# --- Display required parameters
echo " (i) File(s) to commit: ${files_to_commit}"
echo " (i) Commit message: ${commit_message}"

# --- dry-run optional parameter
if [[ -n "${is_dry_run}" && "${is_dry_run}" == "true" ]] ; then
  dry_run="--dry-run "
fi

# --- execute git commit
git_commit_cmd="git commit ${dry_run}-m \"${commit_message}\" ${files_to_commit}"
echo " (i) Executing: '${git_commit_cmd}'"
eval "${git_commit_cmd}"

# --- optionally execute git force push to force_push_branch
if [[ -n "${force_push}" && "${force_push}" == "true" ]] ; then
  if [[ -n "${force_push_branch}" ]] ; then
    force_push_upstream="-u origin ${force_push_branch}"
  fi
  git_push_cmd="git push -f ${dry_run}${force_push_upstream}"
  echo " (i) Executing: '${git_push_cmd}'"
  eval "${git_push_cmd}"
fi

#
# --- Export Environment Variables for other Steps:
# You can export Environment Variables for other Steps with
#  envman, which is automatically installed by `bitrise setup`.
# A very simple example:
#  envman add --key EXAMPLE_STEP_OUTPUT --value 'the value you want to share'
# Envman can handle piped inputs, which is useful if the text you want to
# share is complex and you don't want to deal with proper bash escaping:
#  cat file_with_complex_input | envman add --KEY EXAMPLE_STEP_OUTPUT
# You can find more usage examples on envman's GitHub page
#  at: https://github.com/bitrise-io/envman

#
# --- Exit codes:
# The exit code of your Step is very important. If you return
#  with a 0 exit code `bitrise` will register your Step as "successful".
# Any non zero exit code will be registered as "failed" by `bitrise`.
