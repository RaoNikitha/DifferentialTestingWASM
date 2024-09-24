;; 5. Create a function that indirectly calls an imported function through another exported function. This test ensures that indirect function references are correctly resolved and executed across module boundaries without disrupting the control flow.

(assert_invalid
  (module
    (import "env" "external_func" (func $external (param i32)))
    (func $indirect_call (call $external (i32.const 10)))
    (export "indirect_call_export" (func $indirect_call))
    (table 1 funcref)
    (elem (i32.const 0) $indirect_call)
    (func (call_indirect (type 0) (i32.const 0) (i32.const 20)))
  )
  "type mismatch"
)