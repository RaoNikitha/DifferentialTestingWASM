;; 1. **Test 1**:    - **Description**: Invoke a function within a nested loop structure, where each loop iteration modifies the type of values on the stack.    - **Constraint Checked**: Validates how each implementation handles type consistency within nested control structures.    - **Relation to Block Nesting**: Ensures the function correctly manages stack values across nested loops by calling the function in each loop iteration.

(assert_invalid
  (module
    (func $innerFunc (result i32)
      (i32.const 42)
    )
    (func $testFunc
      (loop $outer
        (loop $inner
          (call $innerFunc)
          br_if $inner
        )
        (call $innerFunc)
        br_if $outer
      )
    )
    (type $sig (func (result i32)))
    (func (call_indirect (type $sig) (i32.const 0) (i32.const 0)))
  )
  "type mismatch"
)