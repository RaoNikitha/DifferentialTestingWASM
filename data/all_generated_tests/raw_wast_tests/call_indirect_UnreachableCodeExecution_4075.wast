;; Implement a function type that returns multiple values but call a function with a different return type signature using `call_indirect`. Validate that this mismatch propagates the control to an `unreachable` path due to incorrect results processing.

(assert_invalid
  (module
    (type (func (param i32) (result i64 f64)))
    (type (func (param i32) (result i64)))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func (type 1) (param i32) (result i64)
      (i64.const 42)
    )
    (func (param i32)
      (call_indirect (type 0) (local.get 0) (i32.const 0))
    )
  )
  "type mismatch"
)