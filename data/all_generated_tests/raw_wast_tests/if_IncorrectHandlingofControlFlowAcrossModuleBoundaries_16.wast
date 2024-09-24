;; 7. **Test Description**: Place an `if` block around calls to exported functions from another module and verify if control returns properly to the original module with the correct stack state.    - **Constraint Checked**: Control flow correctness when interacting with exported functions from another module.    - **Test Relation**: Ensures that calls to different modules preserve the operand stack integrity upon return.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test
      (if (result i32)
        (i32.const 1)
        (then (call $external_func (i32.const 1)))
        (else (call $external_func (i32.const 0)))
      )
    )
  )
  "type mismatch"
)