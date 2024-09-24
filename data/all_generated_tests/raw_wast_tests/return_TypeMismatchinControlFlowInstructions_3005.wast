;; 4. **Test with Loop Return Mismatch**:    - Create a loop where the loop expects `i32` values but returns `f64` instead.    - **Constraint:** The context management should catch this type mismatch upon invoking `return`.    - **Type Mismatch:** Validates type rules within loops for the `return` instruction.

(assert_invalid
  (module
    (func $type-mismatch-loop-return (result i32)
      (loop (result i32)
        (f64.const 1.0)
        (return)
      )
    )
  )
  "type mismatch"
)