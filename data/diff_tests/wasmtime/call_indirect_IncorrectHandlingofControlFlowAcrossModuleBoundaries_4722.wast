;; 1. Test an exported function that calls an imported function via `call_indirect`, ensuring that the correct function type is checked and the stack is properly maintained across the module boundary. This tests if the transition between modules maintains the correct call and operand stack conformity.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (type $type_ref (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $imported_func)
    (func (export "test_func") (param i32) (result i32)
      (call_indirect (type $type_ref) (local.get 0) (i32.const 0))
    )
  )
  "type mismatch"
)