#!/usr/bin/env bats

load test_helper

@test "install hook runs auto-alias on newly installed version" {
  stub nodenv-alias '0.10 --auto : true'

  run nodenv-install 0.10.36

  assert_success
  unstub nodenv-alias
}

@test "install hook works with iojs" {
  stub nodenv-alias 'iojs-1.10 --auto : true'

  run nodenv-install iojs-1.10.36

  assert_success
  unstub nodenv-alias
}

@test "install hook exits cleanly regardless of nodenv-alias" {
  stub nodenv-alias false

  run nodenv-install 0.10.36

  assert_success
}

@test "nodenv-alias STDERR is muted" {
  stub nodenv-alias 'echo FAILURE >&2'

  run nodenv-install 0.10.36

  assert_success
  refute_output_contains FAILURE
}
