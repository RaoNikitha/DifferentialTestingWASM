;; 3. **Test for Nested `nop` within `loop` Constructs**:    - **Description**: Place multiple `nop` instructions in nested `loop` constructs and check for operand type consistency after the loops.    - **Constraint Checked**: Ensures stack types and operand types remain unchanged across complex nested control flows.    - **Relation**: Verifies that `nop` within nested loops doesn’t introduce unintended stack operations or type changes.

(assert_invalid
  (module
    (func $nested-loop-nop
      (loop
        (loop
          nop
        )
        nop
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)