#!/usr/bin/env bats

load test_helper

@test "nodenv-alias 0.8 --auto" {
  create_versions 0.8.0  0.8.5  0.8.10

  run nodenv-alias 0.8 --auto
  assert_success
  assert_alias_version 0.8 0.8.10
}

@test "nodenv-alias iojs-1.2 --auto" {
  create_versions iojs-1.2.0  iojs-1.2.5  iojs-1.2.10

  run nodenv-alias iojs-1.2 --auto
  assert_success
  assert_alias_version iojs-1.2 iojs-1.2.10
}

@test "nodenv-alias name 0.8.5" {
  create_versions 0.8.0  0.8.5  0.8.10

  run nodenv-alias name 0.8.5
  assert_success
  assert_alias_version name 0.8.5
}

@test "nodenv-alias --auto" {
  create_versions 0.8.0        0.8.5        0.8.10
  create_versions 0.10.1       0.10.7       0.10.23
  create_versions iojs-1.10.1  iojs-1.10.7  iojs-1.10.23

  run nodenv-alias --auto

  assert_success
  assert_alias_version 0.8 0.8.10
  assert_alias_version 0.10 0.10.23
  assert_alias_version iojs-1.10 iojs-1.10.23
}

@test "nodenv-alias 1.0.4 --auto removes dangling alias" {
  # alias to non-existant version
  create_alias 1.0 1.0.4

  run nodenv-alias 1.0 --auto

  assert_success
  refute [ -L "$NODENV_ROOT/versions/1.0" ]
}

@test "nodenv-alias 1.0.4 --auto redirects alias to highest remaining version" {
  create_versions 1.0.2
  # alias to non-existant version
  create_alias 1.0 1.0.4

  run nodenv-alias 1.0 --auto

  assert_success
  assert_alias_version 1.0 1.0.2
}
