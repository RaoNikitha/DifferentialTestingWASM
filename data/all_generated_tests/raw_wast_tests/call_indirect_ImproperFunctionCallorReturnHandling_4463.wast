;; 2. Design a test where a function type mismatch is deliberately introduced by calling `call_indirect` with a function that has incompatible parameters from what is expected by `typeidx`. This ensures that implementations correctly detect type mismatches and properly trap.

(assert_invalid
  (module
    (type $ft1 (func (param i32) (result i32)))
    (type $ft2 (func (param i64) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (type $ft1) (param i32) (result i32) (i32.const 42))
    (func (param i64) (result i32)
      (call_indirect (type $ft2) (i32.const 0) (i64.const 57))
    )
  )
  "type mismatch"
)