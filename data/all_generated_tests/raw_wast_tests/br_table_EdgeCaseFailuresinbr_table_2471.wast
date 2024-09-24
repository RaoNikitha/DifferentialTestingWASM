;; 1. **Test Description:**    Ensure the br_table instruction correctly uses the default label when the index is exactly one more than the highest label in the vector.    - **Specific Constraint:** This checks if the implementation properly defaults to the default label when the operand is out of bounds.    - **Edge Case Relation:** Mishandling out-of-bound indices could lead to incorrect branching or crashes.

(assert_invalid
  (module (func $default-label-on-boundary
    (block (br_table 0 1 (i32.const 2)))
  ))
  "unknown label"
)