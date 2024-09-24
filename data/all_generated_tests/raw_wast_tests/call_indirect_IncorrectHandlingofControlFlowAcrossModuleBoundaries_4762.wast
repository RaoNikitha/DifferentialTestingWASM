;; 1. **Test for Cross-Module Function Type Mismatch**:    Import a function from another module with a specific signature—e.g., `(i32) -> i64`—and attempt an indirect call using a type index that specifies a different return type, such as `(i32) -> f64`. This test checks whether the implementation correctly traps on mismatched function types during cross-module function calls.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (type 0)))
    (type (func (param i32) (result f64)))
    (table 1 funcref)
    (elem (i32.const 0) $external_func)
    (func (call_indirect (type 0) (i32.const 0) (i32.const 42)))
  )
  "type mismatch"
)