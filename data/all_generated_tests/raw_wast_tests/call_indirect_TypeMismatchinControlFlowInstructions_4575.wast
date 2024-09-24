;; 4. **Loop with Incorrect Function Type**:     - Place `call_indirect` inside a `loop` where the function type does not match the expected type.     - **Constraint**: Loop must maintain type integrity at each iteration.     - **Test Relation**: Ensures `call_indirect` within loops correctly traps on type mismatch.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32) (result i64)))
    (table funcref)
    (func $f (param i32) (result i32) (i32.const 0))
    (elem (i32.const 0) $f)
    (func
      (loop
        (call_indirect (type $sig2) (i32.const 0))
        br 0
      )
    )
  )
  "type mismatch"
)