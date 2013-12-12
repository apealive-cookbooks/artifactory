#!/usr/bin/env bats

@test "echos things correctly" {
    run echo hello
    [ ${lines[0]} = 'hello' ]
}
