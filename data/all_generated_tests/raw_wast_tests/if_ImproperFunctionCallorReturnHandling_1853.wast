;; 4. A scenario where the `then` block of an `if` instruction contains a function that returns multiple values, which don’t match the expected types for the outer `if` block type, while the `else` block has simple arithmetic operations. The test checks if the mismatched multiple return values are handled correctly.

(assert_invalid
  (module
    (func $multi_return (result i32 i64)
      (i32.const 1)
      (i64.const 2)
    )
    (func $invalid_if (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (call $multi_return)
        )
        (else
          (i32.const 3)
        )
      )
    )
  )
  "type mismatch"
)