;; 1. **Test Description:**    - Import a function from another module with a specific signature, e.g., takes an `i32` and returns an `i32`. Use `call_indirect` with an index referring to this imported function, ensuring the correct table type and function signature match. This test checks for proper module boundary handling and stack operations during cross-module calls.    - **Constraint:** Validate `call_indirect` type conformance and boundary handling for imported functions.    - **Context:** Ensures imported function calls don't corrupt the stack when transitioned between modules.    -

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $imported_func))
    (func $type-cross-module-call
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch or table indexing issue"
)