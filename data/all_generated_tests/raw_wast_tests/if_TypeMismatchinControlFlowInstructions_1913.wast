;; Construct a test where an `if` block without an `else` clause is expected to conform to a `[i32] -> [i32]` block type, but the instructions within the `then` section pop an `i32` without pushing a result. This test enforces checking if the stack state conforms to the block type even when an `else` is absent.

(assert_invalid
  (module (func $test-if-no-else-stack-mismatch
    (i32.const 1)
    (if (result i32)
      (then (drop))
    )
  ))
  "type mismatch"
)