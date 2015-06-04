# Aliases for nodenv Ruby versions

Invoke `nodenv alias <name> <version>` to make a symbolic link from `<name>` to
`<version>` in the [nodenv][] versions directory, effectively creating an
alias.  The cool part is that if you pass in a point release as the name, you
can give `--auto` to link to the latest installed patch level.  For example,
`nodenv alias 1.8.7 --auto` will automatically create an alias from `1.8.7` to
`1.8.7-p371` (or whatever the most recent version you have installed is).

Plus, if you're using [ruby-build][], `nodenv install A.B.C-pXXX` automatically
invokes `nodenv alias A.B.C --auto`, so you'll always have up to date aliases
for point releases.

Whether it's a good idea to use these aliases in a `.ruby-version` file, I
cannot say.  I created this plugin to find out.  If your only concern is
having to reinstall gems every time you install a new patch release, check out
[nodenv-communal-gems][].

## Installation

    mkdir -p ~/.nodenv/plugins
    git clone git://github.com/tpope/nodenv-aliases.git \
      ~/.nodenv/plugins/nodenv-aliases
    nodenv alias --auto

[nodenv]: https://github.com/sstephenson/nodenv
[ruby-build]: https://github.com/sstephenson/ruby-build
[nodenv-communal-gems]: https://github.com/tpope/nodenv-communal-gems
