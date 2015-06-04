#!/usr/bin/env bats

load test_helper

@test "running nodenv-install auto installs an alias" {

  run nodenv-install 0.10.36
  assert_success
  assert_line 'Installed fake version 0.10.36'
  assert_line '0.10 => 0.10.36'

  assert_alias_version 0.10 0.10.36

  run nodenv-install 0.10.22
  assert_success
  assert_alias_version 0.10 0.10.36
  assert_line 'Installed fake version 0.10.22'

  run nodenv-install 0.10.38
  assert_success
  assert_alias_version 0.10 0.10.38
  assert_line 'Installed fake version 0.10.38'
  assert_line '0.10 => 0.10.38'

}

