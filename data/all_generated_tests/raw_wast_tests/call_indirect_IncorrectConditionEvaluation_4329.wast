;; 8. **Test 8**: Trigger a type-specific edge case by having a `call_indirect` instruction use a function type that matches except for optional parameter types. This ensures slight type variations are accurately trapped or flagged by the respective implementations.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (param i64))) 
    (type $sig2 (func (param i32 (param i64 opt)))) 
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32 i64) (result i32)
      (i32.add (local.get 0) (i32.wrap/i64 (local.get 1))))
    (func $test
      (call_indirect (type $sig2) (i32.const 0) (i32.const 0) (i64.const 0))
    )
  )
  "type mismatch"
)