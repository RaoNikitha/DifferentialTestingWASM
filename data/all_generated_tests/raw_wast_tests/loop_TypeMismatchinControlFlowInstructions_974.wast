;; 5. **Test 5: Conditional Branch within Loop with Type Mismatch**    - Description: Have a `br_if` instruction within a loop that conditionally branches based on an i32 but is supposed to handle an f32 according to the loop block type.    - Reasoning: This validates the correct handling of conditional branches within loops, ensuring type consistency between branches and loop block types.

(assert_invalid
  (module
    (func $cond-branch-type-mismatch
      (loop (result f32)
        (i32.const 1)
        (br_if 0)
        (f32.const 0.0)
      )
    )
  )
  "type mismatch in branch condition"
)