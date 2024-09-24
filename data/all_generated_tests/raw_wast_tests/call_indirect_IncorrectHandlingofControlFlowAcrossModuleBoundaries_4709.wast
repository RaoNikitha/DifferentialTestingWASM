;; 8. Implement a module with a `call_indirect` that calls an imported function, which in turn performs another `call_indirect` back into the original module. Check for any issues in maintaining the proper execution flow and context.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (import "env" "external_func" (func $external (type $sig1)))
    (func $indirect_call_back (param i32) (result i32)
      (call_indirect (type $sig1) (local.get 0) (i32.const 0))
    )
    (table 2 funcref)
    (elem (i32.const 0) $external $indirect_call_back)
    (func (export "start_indirect_call") (param i32 i32) (result i32)
      (call_indirect (type $sig2) (local.get 0) (local.get 1))
    )
  )
  "type mismatch"
)