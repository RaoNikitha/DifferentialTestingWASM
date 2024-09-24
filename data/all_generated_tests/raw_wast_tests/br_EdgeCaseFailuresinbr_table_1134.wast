;; 5. **Single Target Table:**    - Create a `br_table` with only one target label and test various indices (within bounds, out of bounds). This checks if single-target tables handle out-of-bounds indices by falling to the default label properly.    - **Constraint:** Ensures simple tables handle indices correctly.

(assert_invalid
  (module 
    (func $single-target-table 
      (block (br_table 0 (i32.const 1)))
    )
  )
  "unknown label"
)