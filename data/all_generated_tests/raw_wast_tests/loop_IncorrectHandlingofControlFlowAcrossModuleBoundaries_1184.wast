;; 5. **Test 5: Loop with Exported Function and Backward Branch**:    - A loop that calls an exported function containing a backward branch to the loop's beginning, creating a recursive-like call sequence.    - **Constraint Checked**: Verifies that recursive-like loop calls do not disrupt stack height upon returning to the initial loop.    - **Relevance**: Ensures correct handling of control flow in loops with backward branches to themselves via exported functions.

(assert_invalid
  (module
    (func $loop_func (result i32)
      (loop (result i32)
        (call $exported_func)
        (br 0)
      )
    )
    (func $exported_func (result i32)
      (i32.const 0)
      (br 0)
    )
    (export "loop_func" (func $loop_func))
  )
  "type mismatch"
)