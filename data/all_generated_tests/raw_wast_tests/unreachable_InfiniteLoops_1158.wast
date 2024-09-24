;; 9. Write a test with a loop that contains an arithmetic operation followed by `br_if` and `unreachable`. Confirm that upon reaching `unreachable`, a trap occurs rather than incorrect `br_if` evaluation leading to an infinite loop.

(assert_invalid
  (module (func $test-loop-with-unreachable
    (block $exit
      (loop $loop
        (i32.const 1)
        (i32.const 1)
        (i32.add)
        (br_if $exit (i32.const 0))
        (unreachable)
      )
    )
  ))
  "type mismatch"
)