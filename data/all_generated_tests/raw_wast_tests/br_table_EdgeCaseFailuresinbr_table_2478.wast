;; 8. **Test Description:**    Perform a test where the br_table operand is just below zero (e.g., `-1`) and confirm whether it properly defaults without causing stack underflow errors.    - **Specific Constraint:** Ensures negative values universally trigger the default label without corrupting the stack.    - **Edge Case Relation:** Bounding errors with negative indices might propagate faults.

(assert_invalid
  (module
    (func $neg-index-br-table
      (block (result i32)
        (br_table 0 1 2 -1)
      )
      (i32.const 0)
    )
  )
  "index out of bounds"
)