#!/usr/bin/env bats

load test_helper

@test "running unalias removes an alias" {

  create_versions 0.8.7
  run nodenv-alias 0.8 --auto
  assert_success

  run nodenv-unalias 0.8
  assert_success
  assert_alias_missing 0.8

}
