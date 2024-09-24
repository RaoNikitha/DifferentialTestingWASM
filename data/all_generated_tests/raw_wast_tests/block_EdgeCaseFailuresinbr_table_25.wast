;; 6. Test containing a `block` with a `br_table` where the default branch (fallback) is out of bounds except for one valid target:    - The `br_table` has several out of range branches and one fallback target set correctly.    - Specific Constraint: Assesses explicit handling of default branches and fallback validity.    - Edge Case: Ensures fallback logic is triggered accurately when primary branches fail.

(assert_invalid
  (module (func $block_with_br_table_out_of_bounds (param i32) (result i32)
    (block (result i32)
      (br_table 2 3 4 5 1 (local.get 0))
      (i32.const 10)
    )
  ))
  "branch index out of bounds"
)