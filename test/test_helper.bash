load ../node_modules/bats-assert/all

unset NODENV_VERSION
unset NODENV_DIR

NODENV_TEST_DIR="${BATS_TMPDIR}/nodenv"

# guard against executing this block twice due to bats internals
if [ "$NODENV_ROOT" != "${NODENV_TEST_DIR}/root" ]; then
  export NODENV_ROOT="${NODENV_TEST_DIR}/root"
  export HOME="${NODENV_TEST_DIR}/home"

  export BATS_TEST_DIRNAME
  export INSTALL_HOOK="${BATS_TEST_DIRNAME}/../etc/nodenv.d/install/autoalias.bash"
  export UNINSTALL_HOOK="${BATS_TEST_DIRNAME}/../etc/nodenv.d/uninstall/autoalias.bash"

  PATH=/usr/bin:/bin:/usr/sbin:/sbin
  PATH="${NODENV_TEST_DIR}/bin:$PATH"
  PATH="${BATS_TEST_DIRNAME}/bin:$PATH"
  PATH="${BATS_TEST_DIRNAME}/../bin:$PATH"
  PATH="${BATS_TEST_DIRNAME}/../nodenv/libexec:$PATH"
  PATH="${BATS_TEST_DIRNAME}/../nodenv/test/libexec:$PATH"
  PATH="${NODENV_ROOT}/shims:$PATH"
  export PATH
fi

teardown() {
  rm -rf "$NODENV_TEST_DIR"
}

# Creates fake version directories
create_versions() {
  for v; do
    #echo "Created version: $d"
    d="$NODENV_TEST_DIR/root/versions/$v"
    mkdir -p "$d/bin"
    echo $v > "$d/RELEASE.txt"
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

assert_line_starts_with() {
  if [ "$1" -ge 0 ] 2>/dev/null; then
    assert_equal "$2" "${lines[$1]}"
  else
    local line
    for line in "${lines[@]}"; do
      if [ -n "${line#${1}}" ]; then return 0; fi
    done
    flunk "expected line \`$1'"
  fi
}
