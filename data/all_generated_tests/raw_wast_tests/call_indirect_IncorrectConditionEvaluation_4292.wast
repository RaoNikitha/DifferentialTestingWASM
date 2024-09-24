;; 1. Compare the behavior when calling a function through `call_indirect` where the dynamic type of the callee function does not match the expected function type (`typeidx`), testing whether a trap correctly occurs or not.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func (type 1))
    (func
      (call_indirect (type 0) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)