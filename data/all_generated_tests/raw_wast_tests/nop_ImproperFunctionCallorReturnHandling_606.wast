;; 7. **Test 7**: Test with a sequence where a `nop` precedes multiple nested `call_indirect` instructions. Ensure that all indirect calls resolve correctly and the intended functions are executed and returned.

(assert_invalid
  (module
    (table 1 funcref)
    (type $sig (func))
    (func $f1 (result i32) (i32.const 0))
    (func (call_indirect (type $sig) (i32.const 0)) (nop) (call_indirect (type $sig) (i32.const 0)) (nop) (call_indirect (type $sig) (i32.const 0)) (nop))
  )
  "type mismatch"
)