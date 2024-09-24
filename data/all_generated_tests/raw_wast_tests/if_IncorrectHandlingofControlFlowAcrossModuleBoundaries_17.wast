;; 8. **Test Description**: Construct an `if` block where the condition is the result of a call to an imported function. Ensure that the true and false branches involve additional calls to imported and local functions.    - **Constraint Checked**: Accuracy in using the returned values from imported modules as `if` conditions.    - **Test Relation**: Highlights potential mismanagement issues in integrating call results within control flow structures.

(assert_invalid
  (module 
    (import "env" "getCondition" (func $getCondition (result i32)))
    (import "env" "trueBranch" (func $trueBranch))
    (import "env" "falseBranch" (func $falseBranch))
    (func $testFunc 
      (if (result i32) (call $getCondition) 
        (then 
          (call $trueBranch)
          (i32.const 42)
        ) 
        (else 
          (call $falseBranch)
          (nop)
        )
      )
    )
  )
  "type mismatch"
)