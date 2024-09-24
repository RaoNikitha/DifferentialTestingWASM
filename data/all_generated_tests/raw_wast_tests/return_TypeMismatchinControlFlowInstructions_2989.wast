;; 8. **Return in Unreachable Code with Mismatched Type**: Create a function where the `return` instruction is placed in code paths marked as unreachable, but the operands to be returned have mismatched types (`i32` instead of `f64`). Test for correct handling of unreachable type validation.

(assert_invalid
  (module
    (func $return_in_unreachable_with_mismatched_type (result f64)
      (unreachable)
      (return (i32.const 42))
    )
  )
  "type mismatch"
)