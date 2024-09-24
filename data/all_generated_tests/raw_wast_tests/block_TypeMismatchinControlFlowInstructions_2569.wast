;; 10. **Test Description**:    Test a block type mismatch by providing an internal sequence of instructions that mismatches the expected output by the block type when exiting the block early using `br` or similar.    **Constraint:** Exit consistency with expected types.    **Relation to Type Mismatch:** Ensures early exits via branching respect stack type constraints.

(assert_invalid
  (module (func $test_block_mismatch (result i32)
    (block (result i32) (br 0 (i64.const 1)))
  ))
  "type mismatch"
)