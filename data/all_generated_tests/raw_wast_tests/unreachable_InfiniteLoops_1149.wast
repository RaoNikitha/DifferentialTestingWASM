;; Test 10: Implement a function containing an infinite loop with a `br_if` which conditionally skips over an `unreachable`, checking if the function ever returns when combined with loop-specific control flow.

(assert_invalid
  (module (func $test-infinite-loop-br_if-unreachable (result i32)
    (block $outer (result i32)
      (loop $inner
        (br_if $outer (unreachable) (i32.const 0))
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)