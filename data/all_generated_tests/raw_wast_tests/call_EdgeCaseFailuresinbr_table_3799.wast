;; 8. **Test: Edge Case with Br_Table Directing to Non-Function Targets**    - **Description**: Include a `br_table` that could redirect to non-function targets (like blocks or loops) followed by a `call` that expects specific stack states.    - **Constraint**: Verify non-function target handling doesn’t disrupt stack for following `call`.    - **Edge Case**: Checks non-standard control flow and its impact on stack setup for `call` operations.

(assert_invalid
  (module
    (func $edge-case-br-table
      (block
        (loop
          (br_table 0 1 0 (i32.const 0))
          (call 0)
        )
      )
    )
    (func (result i32) (i32.const 0))
  )
  "type mismatch"
)