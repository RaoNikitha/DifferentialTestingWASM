;; 6. **Boundary Condition with Empty 'br_table' and Valid Call**:    - This test examines the edge case where 'br_table' has no branches and is followed by a valid function call.    - Generate a 'br_table' configured with zero targets and ensure subsequent valid function calls execute correctly.    - This ensures that both implementations correctly handle edge cases of minimal target branches.

(assert_invalid
  (module
    (func $boundary-test-with-empty-br_table (block (br_table (nop)) (call $valid-function)))
    (func $valid-function)
  )
  "unknown label"
)