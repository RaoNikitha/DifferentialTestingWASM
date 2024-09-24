;; 9. Test Description: Create a block with a sequence of `call_indirect` instructions to functions with gradually varying return types. The block expects the type-checking mechanism to correctly reconcile these calls. WebAssembly’s `check_block` would handle type changes properly, while `wizard_engine` might lead to an improper stack state.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (type $t1 (func (result f32)))
    (func $f (param i32))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func (result i32)
      (block (result i32)
        (call_indirect (type $t0) (i32.const 0) (i32.const 1))
        (call_indirect (type $t1) (i32.const 0) (i32.const 1))
      )
    )
  )
  "type mismatch"
)