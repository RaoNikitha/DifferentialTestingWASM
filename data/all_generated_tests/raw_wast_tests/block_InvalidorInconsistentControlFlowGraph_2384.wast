;; 5. **Test Description**: Construct a block including multiple conditional branches (`br_if`) where one condition never resolves to true.    - **Constraint**: Confirm that all conditional branches are executable based on their conditions.    - **CFG Relation**: Checks if the CFG correctly maps the conditions under which branches are taken.

(assert_invalid
  (module (func $conditional-branches (result i32)
    (block (result i32)
      (i32.const 0)
      (br_if 0 (i32.const 0))
      (i32.const 1)
      (br_if 0 (i32.const 0))
      (i32.const 2)
    )
  ))
  "type mismatch"
)