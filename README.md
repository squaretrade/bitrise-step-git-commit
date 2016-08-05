# Bitrise build step: git commit

### Build Step Parameters
#### Required
* `files_to_commit`: a list of files to commit.
* `commit_message`: commit message.

#### Optional
* `is_dry_run`: true if `git commit` should include the `--dry_run` option
* `force_push`: Set to true if `git push -f` should be performed after succesful `git commit`.
* `force_push_branch`: Branch to force push to. Defaults to `$BITRISE_GIT_BRANCH`

### Build Step Testing
```
$ bitrise run test
```
## TODO
* fix bitrise.yml for sharing.

## Credits
* looked at [Git Tag Step](https://github.com/Itelios/bitrise-steps-git-tag) build step.
