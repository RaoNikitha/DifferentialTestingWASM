;; 1. Test with a `block` containing a `br_table` where the table index exactly matches the number of labels:    - The `br_table` has an index value that is exactly equal to the number of branch labels. Checks if off-by-one errors occur during branch resolution.    - Specific Constraint: Ensures that the `block`'s stack state is correctly unwound.    - Edge Case: Verifies correct handling at the boundary of branch label indices.

(assert_invalid
  (module (func $br_table-edge-case (result i32)
    (block (result i32)
      (block (result i32)
        (i32.const 0)
        (br_table 0 1 (i32.const 1))  ;; br_table with index exactly equal to number of labels
      )
      (i32.const 9)
    )
  ))
  "type mismatch"
)