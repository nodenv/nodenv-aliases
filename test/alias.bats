#!/usr/bin/env bats

load test_helper

@test "nodenv-alias 0.8 --auto" {
  create_versions 0.8.0
  create_versions 0.8.5
  create_versions 0.8.10

  run nodenv-alias 0.8 --auto
  assert_success
  assert_alias_version 0.8 0.8.10
}

@test "nodenv-alias iojs-1.2 --auto" {
  create_versions iojs-1.2.0
  create_versions iojs-1.2.5
  create_versions iojs-1.2.10

  run nodenv-alias iojs-1.2 --auto
  assert_success
  assert_alias_version iojs-1.2 iojs-1.2.10
}

@test "nodenv-alias name 0.8.5" {
  create_versions 0.8.0
  create_versions 0.8.5
  create_versions 0.8.10

  run nodenv-alias name 0.8.5
  assert_success
  assert_alias_version name 0.8.5
}

@test "nodenv-alias --auto" {
  create_versions 0.8.0
  create_versions 0.8.5
  create_versions 0.8.10

  create_versions 0.10.1
  create_versions 0.10.7
  create_versions 0.10.23

  create_versions iojs-1.10.1
  create_versions iojs-1.10.7
  create_versions iojs-1.10.23

  run nodenv-alias --auto

  assert_success
  assert_alias_version 0.8 0.8.10
  assert_alias_version 0.10 0.10.23
  assert_alias_version iojs-1.10 iojs-1.10.23
}
