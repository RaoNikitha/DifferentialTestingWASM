;; 3. **Test for Single Target with Out-of-Bounds Index**:    - Test a `br_table` with only one target but with indices 0 and 1.    - *Constraint*: Checks the handling of out-of-bounds in case of a single available label.    - *Relation*: Evaluates whether both implementations correctly default to the label when index exceeds the single provided target.

(assert_invalid
  (module (func $test_br_table_out_of_bounds
    (block
      (br_table 0 1 (i32.const 0))
    )
  ))
  "unknown label"
)