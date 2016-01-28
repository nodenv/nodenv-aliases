#!/usr/bin/env bats

load test_helper

@test "uninstall hook runs auto-alias on removed version" {
  stub nodenv-alias '0.10 --auto : true'

  run nodenv-uninstall 0.10.36

  assert_success
  unstub nodenv-alias
}
