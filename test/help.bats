#!/usr/bin/env bats

load test_helper

@test "help for alias is available" {
  run nodenv-help 'alias'
  assert_success
  assert_line "Usage: nodenv alias <name> [<version> | --auto | --remove]"
  assert_line "Symlink a short name to an exact version.  Passing a second argument of"
}


@test "help for unalias is available" {
  run nodenv-help 'unalias'
  assert_success
  assert_line 'Usage: nodenv unalias <alias> [<alias> ...]'
  assert_line 'Remove one or more symlinks in the versions directory'
}

