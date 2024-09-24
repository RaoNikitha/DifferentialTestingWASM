;; 1. **Test for Stack State Preservation Across Function Calls**:     - Check if a function that is imported from another module returns a value correctly such that an `if` condition immediately following the call in the host module uses this value.     - **Constraint Focus**: Verifies stack preservation across module boundaries for function calls.

(assert_invalid
  (module
    (import "mod" "func" (func $external_func (result i32)))
    (func $test
      (call $external_func)
      (if (result i32) (then (i32.const 1)) (else (i32.const 0)))
    )
  )
  "type mismatch in block"
)