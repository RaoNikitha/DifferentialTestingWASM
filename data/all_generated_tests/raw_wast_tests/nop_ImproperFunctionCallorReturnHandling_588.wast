;; 9. Test calling a function via `call_indirect` where the called function contains a `nop` instruction before any operations and its `return`, validating that the `nop` does not affect indirect table lookups or return values.

(assert_invalid
  (module
    (table $t 1 funcref)
    (type $sig (func (result i32)))
    (func $nop_func (param) (result i32)
      (nop)
      (i32.const 42)
    )
    (elem (i32.const 0) $nop_func)
    (func (result i32)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)