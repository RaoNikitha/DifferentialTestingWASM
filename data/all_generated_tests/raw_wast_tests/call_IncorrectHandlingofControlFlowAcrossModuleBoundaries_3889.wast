;; 8. **Test Description**:    - **Scenario**: Import two functions with different signatures but using the same index; call both to check for function index conflicts.    - **Constraint**: Verify that the function indices are managed correctly without conflicts across module boundaries.    - **Differential Check**: Ensure WebAssembly and wizard_engine handle this scenario without index mismanagement or incorrect function invocation.

(assert_invalid
  (module
    (import "mod" "func1" (func $imported-func1 (param i32) (result i32)))
    (import "mod" "func2" (func $imported-func1 (param i64) (result i64)))
    (func $test-func
      (call $imported-func1
        (i32.const 42)
      )
    )
  )
  "duplicate function index"
)