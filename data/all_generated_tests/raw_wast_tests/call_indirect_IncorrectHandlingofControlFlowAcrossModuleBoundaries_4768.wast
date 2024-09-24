;; 7. **Test for Incorrectly Exported Function Signature**:    Export a function from one module with a specific signature and import it incorrectly in another module (mismatch in parameter or return types). Perform an indirect call to this function and check if the caller traps correctly, ensuring that function signatures match across module boundaries.

(assert_invalid
  (module
    (import "module_a" "func" (func $imported_func (param i32) (result f64)))
    (type (func (param f64) (result i32)))
    (table funcref (elem $imported_func))
    (func $test_call_indirect 
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)