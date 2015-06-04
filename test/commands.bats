#!/usr/bin/env bats

load test_helper

@test "alias is listed in nodenv commands" {
  run nodenv-commands
  assert_success
  assert_line "alias"
}

@test "commands --sh should not list alias" {
  run nodenv-commands --sh
  assert_success
  refute_line "alias"
}

@test "commands --no-sh should list alias" {
  run nodenv-commands --no-sh
  assert_success
  assert_line "alias"
}

@test "unalias is listed in nodenv commands" {
  run nodenv-commands
  assert_success
  assert_line "unalias"
}

@test "commands --sh should not list unalias" {
  run nodenv-commands --sh
  assert_success
  refute_line "unalias"
}

@test "commands --no-sh should list unalias" {
  run nodenv-commands --no-sh
  assert_success
  assert_line "unalias"
}
