;; 1. **Test: Cross-Module Function Type Check**    - Description: A module with a function table that imports a function from another module. The importing module attempts to call the imported function using `call_indirect` with a type signature that slightly deviates from the original. This checks if the `call_indirect` correctly identifies type mismatches across module boundaries.    - Constraint Checked: Function type conformity and dynamic type checking.    - Related to Control Flow: Ensures proper type validation when transitioning control to an imported function.

 ;; (module
  (type $original_sig (func (param i32) (result i32)))
  (import "external_module" "external_func" (func $imported_func (type $original_sig)))
  (table funcref (elem $imported_func))
  (type $incorrect_sig (func (param i32 i32) (result i32)))
  (func $test_func
    (call_indirect (type $incorrect_sig) (i32.const 0) (i32.const 1) (i32.const 2))
  )
)
(assert_invalid (invoke "test_func") "type mismatch")