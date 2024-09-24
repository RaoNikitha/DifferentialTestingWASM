;; 10. **Test 10**:     - **Description**: Nested structure with multiple `br_if` instructions, each targeting different levels of outer blocks based on specific operand conditions in a mixed `block-loop` setup.     - **Constraint**: Checking correct execution paths based on complex operand conditions.     - **CFG Relation**: Confirms CFG accurately captures multi-branch scenarios for nested mixed structures.

(assert_invalid
  (module
    (func $complex-br_if-nesting
      (block
        (block
          (loop
            (i32.const 0) (i32.const 1)
            (br_if 1) ; Should target the second block if non-zero (1)
            (i32.const 0)
            (br_if 0) ; Should loop again if zero (0)
          )
          (i32.const 0)
          (br_if 0) ; Should target the first block if condition is zero
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)