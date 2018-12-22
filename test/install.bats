#!/usr/bin/env bats

load test_helper

@test "install hook runs auto-alias on newly installed version" {
  stub nodenv-alias '6 --auto : true'
  stub nodenv-alias '6.9 --auto : true'

  run nodenv-install 6.9.5

  assert_success
  unstub nodenv-alias
}

@test "install hook doesn't alias major 0" {
  stub nodenv-alias '0.10 --auto : true'

  run nodenv-install 0.10.36

  assert_success
  unstub nodenv-alias
}

@test "install hook auto-aliases pre-releases" {
  stub nodenv-alias '8 --auto : true'
  stub nodenv-alias '8.0 --auto : true'
  stub nodenv-alias '8.0.0-rc --auto : true'

  run nodenv-install 8.0.0-rc.2

  assert_success
  unstub nodenv-alias
}

@test "install hook works with iojs" {
  stub nodenv-alias 'iojs-1 --auto : true'
  stub nodenv-alias 'iojs-1.10 --auto : true'

  run nodenv-install iojs-1.10.36

  assert_success
  unstub nodenv-alias
}

@test "install hook exits cleanly regardless of nodenv-alias" {
  stub nodenv-alias false

  run nodenv-install 0.10.36

  assert_success
  unstub nodenv-alias
}

@test "nodenv-alias STDERR is muted" {
  stub nodenv-alias 'echo FAILURE >&2'

  run nodenv-install 0.10.36

  assert_success
  refute_output --partial FAILURE
  unstub nodenv-alias
}
