;; 5. **Test for Function Return Types Mismatch**:    - **Description**: Define a function that returns types different from what the caller expects.    - **Constraint Checked**: Return value type consistency between function and caller context.    - **CFG Relevance**: Ensures return value types do not disrupt CFG paths.

(assert_invalid
  (module
    (func $test-call-return-mismatch
      (if (i32.const 1)
        (then
          (call 1)
        )
      )
    )
    (func (result i32))
  )
  "type mismatch"
)