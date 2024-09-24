;; 8. **Test 8: Cross-Module Function References**:    - **Description**: Use `call_indirect` to reference functions imported from another module and define multiple tables crossing module boundaries.    - **Constraint Checked**: Validates proper handling of multiple modules and cross-references in function calls.    - **CFG Relation**: Evaluates CFG's capacity to accurately model inter-module function dependencies and their dynamic resolution at runtime.

 ;; (module
  (import "env" "external_func" (func $external_func (param i32) (result i32)))
  (type $sig (func (param i32) (result i32)))
  (table 1 funcref)
  (elem (i32.const 0) $external_func)
  (type (func (param i32)))
  (func (export "test") (param i32) (result i32)
    (call_indirect (type 0) (local.get 0) (i32.const 0))
  )
)