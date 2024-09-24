;; 1. **Test for Invalid Operand Type on Return**: Construct a function that attempts to return an operand of type `i32` when the function expects a return type of `f64`. The test checks if `return` instruction correctly identifies and handles this type mismatch.

(assert_invalid
  (module
    (func $type-mismatch-on-return (result f64)
      (i32.const 42)
      (return)
    )
  )
  "type mismatch"
)