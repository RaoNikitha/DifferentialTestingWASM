;; 4. **Test Nested Import Calls with Returns**:    - Description: Create a scenario where an exported function calls an imported function that itself calls another imported function. Each function performs stack operations and returns. Validate the consistency of the stack across this nested calling structure.    - Constraint: Ensure that stack unwinding and returns are managed correctly across multiple layers of function calls and returns between modules.

(assert_invalid
  (module
    (import "env" "imported_func1" (func $imported_func1 (result i32)))
    (import "env" "imported_func2" (func $imported_func2 (result i64)))
    (func $test_func (result i32)
      call $imported_func1
      call $imported_func2
      return
    )
  )
  "type mismatch"
)