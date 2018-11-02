# shellcheck shell=bash

load ../node_modules/bats-assert/all
load ../node_modules/bats-mock/stub

unset NODENV_VERSION
unset NODENV_DIR

export NODENV_HOOK_PATH="${BATS_TEST_DIRNAME}/../etc/nodenv.d"

# guard against executing this block twice due to bats internals
if [ "$NODENV_ROOT" != "${BATS_TMPDIR}/nodenv" ]; then
  export NODENV_ROOT="${BATS_TMPDIR}/nodenv"

  PATH=/usr/bin:/bin:/usr/sbin:/sbin
  PATH="${BATS_TEST_DIRNAME}/bin:$PATH"
  PATH="${BATS_TEST_DIRNAME}/../bin:$PATH"
  export PATH
fi

teardown() {
  rm -rf "$NODENV_ROOT"
}

# Creates fake version directories
create_versions() {
  for v; do
    #echo "Created version: $d"
    d="$NODENV_ROOT/versions/$v"
    mkdir -p "$d/bin"
    echo "$v" > "$d/RELEASE.txt"
    ln -nfs /bin/echo "$d/bin/node"
  done
}

# Creates test aliases
create_alias() {
  local alias="$1"
  local version="$2"

  mkdir -p "$NODENV_ROOT/versions"
  ln -nfs "$NODENV_ROOT/versions/$version" "$NODENV_ROOT/versions/$alias"
}

# assert_alias_version alias version

assert_alias_version() {
  if [ ! -f "$NODENV_ROOT/versions/$1/RELEASE.txt" ]; then
    echo "Versions:"
    ls -l "$NODENV_ROOT/versions"
  fi
  assert_equal "$2" "$(cat "$NODENV_ROOT/versions/$1/RELEASE.txt" 2>&1)"
}

assert_alias_missing() {
  if [ -f "$NODENV_ROOT/versions/$1/RELEASE.txt" ]; then
    assert_equal "no-version" "$(cat "$NODENV_ROOT/versions/$1/RELEASE.txt" 2>&1)"
  fi
}
