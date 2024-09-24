;; 5. Generate a test with nested `call_indirect` instructions where an inner function's result is used in a subsequent indirect call. Type mismatching between any of the calls should result in a trap due to improper call chain validation.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (table 2 funcref)
    (elem (i32.const 0) 0 1)
    (func $inner (type 0) (param i32) (result i32) (i32.const 42))
    (func $outer (type 1)
      (call_indirect (type 0) (i32.const 1))
      (call_indirect (type 1) (i32.const 0))
    )
  )
  "type mismatch"
)