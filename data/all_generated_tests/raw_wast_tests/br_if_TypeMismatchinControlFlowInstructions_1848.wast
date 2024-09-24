;; 9. **Test 9: Forward Branch with Mismatched Output Types**    - **Description**: A forward branch to a block expecting a specific output type, but `br_if` results in differing types.    - **Constraint Checked**: Both implementations must guarantee type safety and correct output types as specified by the block.    - **Relation to Type Mismatch**: Immediate type errors due to incorrect result types for forward branches.

(assert_invalid
  (module
    (func (block (result i32)
      (i32.const 1) (br_if 0 (i64.const 1))
    ))
  )
  "type mismatch"
)