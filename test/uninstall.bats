#!/usr/bin/env bats

load test_helper

@test "running nodenv-uninstall auto removes the alias" {
  create_versions 0.10.36
  create_alias 0.10 0.10.36

  run nodenv-uninstall 0.10.36

  assert_success
  assert_line 'Uninstalled fake version 0.10.36'
  assert_line_starts_with 'Removing invalid link from 0.10'
  refute [ -L "$NODENV_ROOT/versions/0.10" ]
}

@test "running nodenv-uninstall auto updates the alias to highest remaining version" {
  create_versions 0.10.2 0.10.4
  create_alias 0.10 0.10.4

  run nodenv-uninstall 0.10.4

  assert_success
  assert_line 'Uninstalled fake version 0.10.4'
  assert_line_starts_with 'Removing invalid link from 0.10'
  assert_line '0.10 => 0.10.2'
  assert_alias_version 0.10 0.10.2
}
