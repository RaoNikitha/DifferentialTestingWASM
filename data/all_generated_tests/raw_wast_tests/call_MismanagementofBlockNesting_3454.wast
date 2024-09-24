;; 3. **Conditional Branching with Calls**:    - **Test Description**: Create conditional constructs (`if` and `else`) nested within a block, where each branch calls different functions. The test verifies that the correct function is called based on the condition, and the stack is correctly managed.    - **Constraint Checked**: Correct branching and argument handling in nested conditional branches.    - **Relation to Mismanagement of Block Nesting**: Ensures conditional branching does not disrupt caller-callee stack agreements.

(assert_invalid
  (module
    (func $func_true (result i32)
      i32.const 1)
    (func $func_false (result i32)
      i32.const 0)
    (func $test_conditional_call (param i32) (result i32)
      (block
        (if (i32.eq (local.get 0) (i32.const 1))
          (then
            (call $func_true)
          )
          (else
            (call $func_false)
          )
        )
      )
    )
  )
  "type mismatch"
)