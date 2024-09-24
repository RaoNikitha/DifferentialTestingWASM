;; 9. **Test Description**: A scenario where an `if` block includes a loop that contains calls to both imported and exported functions, simulating heavy stack usage and state transitions.    **Constraint**: Checks if loops within control flow maintain stack integrity during repeated calls across module boundaries.    **Goal**: Identifies looping and state management bugs related to control flow and module transitions.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func $exported_func (export "exported_func")
      (if (result i32) (i32.const 1) 
        (then 
          (loop 
            (call $external_func)
            (br_if 1 (i32.const 1))
          )
        )
        (else (call $external_func))
      )
    )
  )
  "type mismatch"
)