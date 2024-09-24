;; 6. **Test `if` with Different Block Types**:    - Define an `if` block with an `i32` block type, ensuring the CFG respects the input stack type requirements and matches outputs accordingly.    - **Constraint Checked**: verifies block types are enforced properly within the CFG.

(assert_invalid
  (module
    (func $test-if-block-type (result i32)
      (if (result i32) (i32.const 1)
        (then (i32.const 1) (drop))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)