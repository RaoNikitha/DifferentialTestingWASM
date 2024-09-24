;; 2. Test execution of multiple nested `call_indirect` instructions with varying function signatures to check if each function correctly manages the stack depth, ensuring no stack overflow or underflow occurs across nested calls.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f64) (result f64)))
    (table 2 funcref)
    (elem (i32.const 0) 0)
    (elem (i32.const 1) 1)
    (func $nested1 (param i32) (result i32)
        (call_indirect (type $sig1) (i32.const 0) (call_indirect (type $sig1) (i32.const 0) (local.get 0)))
    )
    (func $nested2 (param f64) (result f64)
        (call_indirect (type $sig2) (i32.const 0) (call_indirect (type $sig2) (i32.const 0) (local.get 0)))
    )
  )
  "type mismatch"
)