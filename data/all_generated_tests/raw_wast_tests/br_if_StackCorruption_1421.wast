;; 2. **Test Description**:     Create a nested `block` with multiple `br_if` instructions targeting different depths. Verify that the correct label is targeted, and any incorrect lookup in the wizard_engine results in an out-of-bounds error.    - **Constraint Checked**: Correct depth calculation relative to label positioning.    - **Stack Corruption Check**: Tests for proper stack state post `br_if` execution to avoid underflows or overflows.

(assert_invalid
  (module 
    (func 
      (block 
        (block 
          (block 
            (br_if 2 (i32.const 0))
            (br_if 1 (i32.const 1))
            (br_if 0 (i32.const 1))
          )
        )
      )
    )
  )
  "invalid label"
)