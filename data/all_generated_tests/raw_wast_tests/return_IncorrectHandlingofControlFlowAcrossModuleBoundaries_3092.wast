;; 1. **Test 1: Returns from Imported Function Fail**   Create a WASM module that imports a function from another module. The imported function returns multiple values. Check whether the return values are correctly managed and match the expected type signature when called from the main module. This tests if `return` handles multi-value returns across module boundaries correctly in both engines.   **Constraint**: Validate if `c.results` and `checkAndPopArgs` handle the stack consistency for multi-value returns.   **Relation to Incorrect Handling of Control Flow**: Ensures stack unwinding and operand handling correctness when returning from imported functions.

(assert_invalid
  (module
    (import "env" "func" (func $imported_func (result i32 i32)))
    (func $type-value-empty-vs-multi-value-return (result i32 i32)
      (call $imported_func)
      (return)
    )
  )
  "type mismatch"
)