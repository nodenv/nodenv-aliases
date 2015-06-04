# Aliases for nodenv Node versions

Invoke `nodenv alias <name> <version>` to make a symbolic link from `<name>` to
`<version>` in the [nodenv][] versions directory, effectively creating an
alias.  The cool part is that if you pass in a point release as the name, you
can give `--auto` to link to the latest installed patch level.  For example,
`nodenv alias 1.8.7 --auto` will automatically create an alias from `1.8.7` to
`1.8.7-p371` (or whatever the most recent version you have installed is).

Plus, if you're using [node-build][], `nodenv install A.B.C-pXXX` automatically
invokes `nodenv alias A.B.C --auto`, so you'll always have up to date aliases
for point releases.

## Installation

    mkdir -p ~/.nodenv/plugins
    git clone git://github.com/jasonkarns/nodenv-aliases.git \
      ~/.nodenv/plugins/nodenv-aliases
    nodenv alias --auto

[nodenv]: https://github.com/OiNutter/nodenv
[node-build]: https://github.com/OiNutter/node-build
