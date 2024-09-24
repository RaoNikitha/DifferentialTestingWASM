;; 8. **Test 8: Conditional Branch Type Mismatch**:    - **Test Description**: Use a conditional branch that has non-matching types for different branches due to a function call in one branch.    - **Constraint**: This test validates that branch types conform to expected type constraints with the function call.    - **Type Mismatch**: If the call results in different types, an error should be raised.

(assert_invalid
  (module
    (func $trueBranch (result i32)
      (i32.const 42)
    )
    (func $falseBranch
      (call $trueBranch)
    )
    (func $conditionalBranch 
      (i32.const 0)
      (if (result i32)
        (then 
          (call $trueBranch) 
        )
        (else 
          (call $falseBranch)
        )
      )
    )
  )
  "type mismatch"
)