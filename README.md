[![Build Status](https://travis-ci.org/jasonkarns/nodenv-aliases.svg?branch=master)](https://travis-ci.org/jasonkarns/nodenv-aliases)

# Aliases for nodenv Node versions

Invoke `nodenv alias <name> <version>` to make a symbolic link from `<name>` to
`<version>` in the [nodenv][] versions directory, effectively creating an
alias.  The cool part is that if you pass in a point release as the name, you
can give `--auto` to link to the latest installed patch level.  For example,
`nodenv alias 0.10 --auto` will automatically create an alias from `0.10` to
`0.10.36` (or whatever the most recent version you have installed is).

Plus, if you're using [node-build][], `nodenv install major.minor.patch`
automatically invokes `nodenv alias major.minor --auto`, so you'll always have
up to date aliases for point releases.

## Installation

    git clone https://github.com/jasonkarns/nodenv-aliases.git $(nodenv root)/plugins/nodenv-aliases

## Usage

Create a `major.minor` alias for each installed minor release:

    nodenv alias --auto

Create a `major.minor` alias for the highest minor release of, say 0.8:

    nodenv alias 0.8 --auto

Create a named alias for a specific release:

    nodenv alias my-favorite-node 0.10.36

Remove an alias:

    nodenv unalias <alias-name>

or

    nodenv alias <alias-name> --remove

## Credits

Forked from [rbenv-aliases][] originally by [tpope][] and modified to work for nodenv.

[nodenv]: https://github.com/OiNutter/nodenv
[node-build]: https://github.com/OiNutter/node-build
[rbenv-aliases]: https://github.com/tpope/rbenv-aliases
[tpope]: https://github.com/tpope
