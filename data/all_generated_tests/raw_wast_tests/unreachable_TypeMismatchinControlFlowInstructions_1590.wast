;; 1. Define a function with a `block` instruction that concludes with `unreachable` while expecting an `i32` result. The test checks if the control flow recognizes the mismatch when the `block` exits without a valid `i32` value.

(assert_invalid
  (module
    (func $test-block-with-unreachable (result i32)
      (block (result i32)
        (i32.const 1)
        (unreachable)
      )
    )
  )
  "type mismatch"
)