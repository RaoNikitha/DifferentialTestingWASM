;; 8. **Multiple Targets with Default Fallthrough:**    - Provide a `br_table` with multiple valid targets but give an index that is beyond all these targets to see if it correctly falls to the default.    - **Constraint:** Ensures correct handling and fallback to the default label.

(assert_invalid
  (module (func $multiple-targets-default-fallthrough
    (block
      (block
        (block
          (br_table 0 1 2 3 (i32.const 4))
))
))
  ))
  "unknown label"
)