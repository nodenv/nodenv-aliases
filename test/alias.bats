#!/usr/bin/env bats

load test_helper

@test "nodenv-alias 1.8.7 --auto" {
  create_versions 1.8.7-p371
  create_versions 1.8.7-p99
  create_versions 1.8.7-p100

  run nodenv-alias 1.8.7 --auto
  assert_success
  assert_alias_version 1.8.7 1.8.7-p371
}

@test "nodenv-alias name 1.8.7-p100" {
  create_versions 1.8.7-p371
  create_versions 1.8.7-p99
  create_versions 1.8.7-p100

  run nodenv-alias name 1.8.7-p100
  assert_success
  assert_alias_version name 1.8.7-p100
}

@test "nodenv-alias --auto" {
  create_versions 1.8.7-p371
  create_versions 1.8.7-p99
  create_versions 1.8.7-p100

  create_versions 1.2.3-p99-perf
  create_versions 1.2.3-p234-beta
  create_versions 1.2.3-p1-perf

  run nodenv-alias --auto
  assert_success
  assert_alias_version 1.8.7 1.8.7-p371
  assert_alias_version 1.2.3 1.2.3-p234-beta

}
