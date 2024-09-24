;; 2. **Test Returning from Imported Function with Complex Operand Stack**:    - Description: Import a function that performs multiple stack operations (e.g., pushing values) before returning. Call this function from the exporting module and validate that all values pushed before return are correctly unwound.    - Constraint: Ensure the operand stack is correctly unwound and matches expected types and values after returning from imported function.

(assert_invalid
 (module
  (import "env" "imported_func" (func $imported_func))
  (func (result i32)
   (call $imported_func)
   (i32.const 0)
   (return)
  )
 )
 "type mismatch"
)