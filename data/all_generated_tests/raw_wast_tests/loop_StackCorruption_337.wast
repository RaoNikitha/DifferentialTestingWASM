;; 8. **Test 8**:    - **Description**: Implement a loop where the exit condition involves multiple nested condition checks and `br_if` instructions.    - **Constraint**: Conditional branching and context extension validations.    - **Stack Corruption Check**: Verify that the stack doesn't corrupt due to nested condition checks and premature exits.

(assert_invalid
  (module
    (func $test8
      (loop (result i32)
        (i32.const 42)
        (loop (result i32)
          (i32.const 7)
          (br_if 0
            (i32.lt_s (i32.const 1) (i32.const 2))
          )
          (br_if 1
            (i32.gt_s (i32.const 5) (i32.const 3))
          )
        )
        (drop)
      )
    )
  )
  "type mismatch"
)