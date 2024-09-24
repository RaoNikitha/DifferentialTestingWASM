;; 7. **Loop with Early Return and Incorrect Type**:    - Implement a loop with an early return where the expected type is `i32`, but the `return` instruction passes a `f32` instead.    - **Constraint:** Early returns in loops should still align with the loop's type expectations.    - **Type Mismatch:** Ensures correct type checks for early returns inside loops.

(assert_invalid
  (module
    (func $loop-with-early-return-incorrect-type (result i32)
      (i32.const 0)
      (loop (return (f32.const 0.0)))
    )
  )
  "type mismatch"
)