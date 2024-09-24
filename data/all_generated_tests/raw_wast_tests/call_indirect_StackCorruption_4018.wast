;; 7. Execute a sequence of `call_indirect` instructions where each call increases the stack depth substantially (e.g., through large return values), testing for correct handling and ensuring no overflow or memory corruption.

(assert_invalid
  (module
    (type $sig (func (result i64)))
    (type $sig1 (func (result i64)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (result i64) (i64.const 1234567890123456789))
    (func $type-stack-depth (result i64)
      (call_indirect (type $sig) (i32.const 0))
      (call_indirect (type $sig1) (i32.const 0))
    )
  )
  "stack depth increase"
)