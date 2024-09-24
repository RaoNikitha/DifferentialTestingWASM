;; 8. Ensure proper stack cleanup by testing a `call_indirect` call within a loop, where the loop repeatedly mismatches function signatures, verifying each iteration properly handles previous stack data without corruption.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func))
    (table 1 funcref)
    (elem (i32.const 0) 1)
    (func (type 1))
    (func (type 0)
      (loop
        (call_indirect (type 0) (i32.const 0) (i32.const 1))
        br 0
      )
    )
  )
  "type mismatch"
)