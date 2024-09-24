;; 6. **Test Description**:    - **Constraint Checked**: Proper handling of conditional evaluation order.    - **Details**: Create a `br_table` that utilizes nested conditional branches in an unusual order, testing if the `br_if` conditions evaluate in the correct sequence.    - **Relation to Edge Case**: Ensures that nested conditions and sequencing in control flow are correctly interpreted, testing the executable order handling.

(assert_invalid
  (module
    (func $nested-correct-conditional-order
      (block (result i32)
        (block (result i32)
          (br_if 1 (i32.const 0))
          (i32.const 42)
          (br 0)
        )
        (i32.const 99)
      )
    )
  )
  "type mismatch"
)