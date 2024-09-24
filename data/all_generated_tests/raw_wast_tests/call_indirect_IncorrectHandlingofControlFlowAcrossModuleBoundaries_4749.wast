;; 8. **Test Description:**    - Import a function with complex parameter types (including `structs` or `arrays`) in another module. Use `call_indirect` to call this function, ensuring complex parameters are correctly pushed to and popped from the stack.    - **Constraint:** Validate handling complex parameter types across modules.    - **Context:** Ensures proper parameter passing and stack management for complex types in cross-module calls using `call_indirect`.    -

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32 f64) (result i32)))
    (type $sig (func (param i32 f64) (result i32)))
    (table funcref (elem $imported_func))
    (func $complex_param_call_indirect
      (i32.const 42) (f64.const 84.0)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)