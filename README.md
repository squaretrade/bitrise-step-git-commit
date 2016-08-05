# Git commits (and optionally pushes) a single file

### Build Step Parameters
#### Required
* `file_to_commit`: full path to file to commit.
* `commit_message`: commit message.

#### Optional
* `is_dry_run`: true if `git commit` should include the `--dry_run` option
* `force_push`: Set to true if `git push -f` should be performed after succesful `git commit`.
* `force_push_branch`: Branch to force push to. Defaults to `$BITRISE_GIT_BRANCH`

## TODO
* fix bitrise.yml for sharing.
* Support passing in multiple files to commit

## Credits
* looked at [Git Tag Step](https://github.com/Itelios/bitrise-steps-git-tag) build step.
