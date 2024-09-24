;; 6. **Mismatched Result Types in Loop**:    - **Description**: Test a loop that ends with a result type different from the specified `blocktype`, leading to a mismatch in expected types.    - **Constraint Checked**: Matching result types and correct type propagation through the loop.    - **CFG Relevance**: Ensures the CFG correctly reflects the type flows, with accurate type matching at loop boundaries.

(assert_invalid
  (module (func $mismatched-result-types (result i32)
    (loop (result i32)
      (i32.const 1)
    )
    (i32.const 2)
  ))
  "type mismatch"
)