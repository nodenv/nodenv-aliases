#!/usr/bin/env bats

load test_helper

@test "uninstall hook runs auto-alias on removed version" {
  stub nodenv-alias '6 --auto : true'
  stub nodenv-alias '6.9 --auto : true'

  run nodenv-uninstall 6.9.5

  assert_success
  unstub nodenv-alias
}

@test "uninstall hook doesn't alias major 0" {
  stub nodenv-alias '0.10 --auto : true'

  run nodenv-uninstall 0.10.36

  assert_success
  unstub nodenv-alias
}

@test "uninstall hook runs auto-aliases pre-releases" {
  stub nodenv-alias '8 --auto : true'
  stub nodenv-alias '8.0 --auto : true'
  stub nodenv-alias '8.0.0-rc --auto : true'

  run nodenv-uninstall 8.0.0-rc.2

  assert_success
  unstub nodenv-alias
}

@test "uninstall hook works with iojs" {
  stub nodenv-alias 'iojs-1 --auto : true'
  stub nodenv-alias 'iojs-1.10 --auto : true'

  run nodenv-uninstall iojs-1.10.36

  assert_success
  unstub nodenv-alias
}

@test "uninstall hook exits cleanly regardless of nodenv-alias" {
  stub nodenv-alias false

  run nodenv-uninstall 0.10.36

  assert_success
  unstub nodenv-alias
}

@test "nodenv-alias STDERR is muted" {
  stub nodenv-alias 'echo FAILURE >&2'

  run nodenv-uninstall 0.10.36

  assert_success
  refute_output_contains FAILURE
  unstub nodenv-alias
}
