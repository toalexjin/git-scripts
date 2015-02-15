# Git Custom Scripts

This project offers following git scripts:
* `git sync`: Synchronize two remote branches by merging them and then pushing back to remote. This command is quite useful if you have two remote repositories that might be updated in parallel.
* `git pushself`: Push current branch to remote repository with the same branch name. When you are on a feature/bugfix branch whose name might be very long, then you could use this command to push the branch to remote without specifying branch name.

## Requirements

1. `asciidoc` is required to build man pages
  * CentOS 6/7: `yum install asciidoc`
  * Ubuntu, Amazon EC2 Redhat 7: http://asciidoc.org/INSTALL.html

## Install

* make clean
* make build
* sudo make install

## Uninstall

* sudo make uninstall

## Examples

* `git sync develop shanghai beijing`: Synchronize `shanghai/develop` with `beijing/develop`.
* `git sync shanghai/master beijing/mirror`: Synchronize `shanghai/master` with `beijing/mirror`.
* `git pushself -a`: Push current branch to all remote repositories.
* `git pushself -a -b newname`: Push current branch to branch `newname` of all remote repositories.
* `git help sync`: See man page.
* `git help pushself`: See man page.

