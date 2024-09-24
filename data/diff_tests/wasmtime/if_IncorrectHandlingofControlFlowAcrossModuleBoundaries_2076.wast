;; 7. **Test for Error Handling Across Modules**:    - Ensure calling a function that intentionally traps from an imported module within an `if` block produces correct error handling such that the execution flow can proceed to the `else` or terminate correctly.    - **Constraint Focus**: Ensures correct trapping mechanism and flow continuation across modules.

(assert_invalid
  (module
    (import "env" "trap_func" (func $trap_func))
    (func $test_if_trap (result i32)
      (if (result i32) (i32.const 0)
        (then (call $trap_func) (i32.const 0))
        (else (i32.const 1))
      )
    )
  )
  "function must trap correctly"
)