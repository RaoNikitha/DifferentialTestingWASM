;; 10. **Test Cross-Module Multiple Return Values**:     - Description: Create a function in the exporting module that calls an imported function returning multiple values. Validate whether all returned values are correctly managed and accessible in the exporting module.     - Constraint: Validate that multiple return values are correctly handled and maintained across the module boundary.

(assert_invalid
  (module
    (import "env" "multi_return_func" (func $multi_return_func (result i32 i32)))
    (func $cross_module_multiple_return_values
      local.get 0
      (call $multi_return_func)
      (return (local.get 0))
    )
  )
  "type mismatch"
)