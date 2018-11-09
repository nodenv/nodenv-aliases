# nodenv-aliases

[![Build Status](https://travis-ci.org/nodenv/nodenv-aliases.svg?branch=master)](https://travis-ci.org/nodenv/nodenv-aliases)

Aliases for nodenv Node versions

Invoke `nodenv alias <name> <version>` to make a symbolic link from `<name>` to
`<version>` in the [nodenv][] versions directory, effectively creating an
alias.  The cool part is that if you pass in a major or major.minor release as the name, you
can give `--auto` to link to the latest installed minor or patch level (respectively).  For example,
`nodenv alias 4.4 --auto` will automatically create an alias from `4.4` to
`4.4.7` (or to whatever is the most recent version you have installed). Similarly,
`nodenv alias 6 --auto` will automatically create an alias from `6` to
`6.10.3` (or to whatever is the most recent version you have installed).

Plus, if you're using [node-build][], `nodenv install major.minor.patch`
automatically invokes `nodenv alias major --auto` and
`nodenv alias major.minor --auto`, so you'll always have
up to date aliases.

## Installation

    git clone https://github.com/nodenv/nodenv-aliases.git $(nodenv root)/plugins/nodenv-aliases

## Usage

Create a `major` and `major.minor` alias for each installed major and minor release:

    nodenv alias --auto

Create a `major` alias for the highest major release of, say 6:

    nodenv alias 6 --auto

Create a `major.minor` alias for the highest minor release of, say 0.8:

    nodenv alias 0.8 --auto

Create a `major.minor.patch-pre` alias for the highest prerelease of, say 8:

    nodenv alias 8.0.0-rc --auto

Create a named alias for a specific release:

    nodenv alias boron 6

Remove an alias:

    nodenv unalias <alias-name>

or

    nodenv alias <alias-name> --remove

## Credits

Forked from [Tim Pope][tpope]'s [rbenv-aliases][] by [Jason Karns][jasonkarns] and modified for nodenv.

[nodenv]: https://github.com/nodenv/nodenv
[node-build]: https://github.com/nodenv/node-build
[rbenv-aliases]: https://github.com/tpope/rbenv-aliases
[tpope]: https://github.com/tpope
[jasonkarns]: https://github.com/jasonkarns
