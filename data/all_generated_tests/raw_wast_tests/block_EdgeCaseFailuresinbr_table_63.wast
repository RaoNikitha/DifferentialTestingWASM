;; 4. **Test with `br_table` Default Target Out-of-Bound**:    - A `block` where the `br_table` has all valid indices except the default target index, which is out of bounds.    - This pushes the validation to ensure the default target handling part of `br_table` checks index validity.    - Edge Case: Wizard_engine's state reset mechanisms might mishandle the default out-of-bound target, causing incorrect branching.

(assert_invalid
  (module
    (func
      (block (br_table 0 1 2 3 4 5 6 7 (i32.const 42))) ; assuming label 42 is out of bounds
    )
  )
  "unknown label"
)