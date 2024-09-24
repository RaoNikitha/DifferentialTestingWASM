;; - **Test 10**:   An `if` statement where the true-branch has a `br_if` instruction, misaligned with the false-branch due to different data types being pushed on the stack (e.g., true pushes `i32` while false expects `f32`).   - **Reason**: Ensures valid type handling between true and false branches within an `if` construct.   - **Constraint**: Conditional branches must ensure consistent result types across both branches.

(assert_invalid
  (module
    (func $test
      (if (result f32)
        (i32.const 1)
        (then (br_if 0 (i32.const 1) (i32.const 1)))
        (else (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)