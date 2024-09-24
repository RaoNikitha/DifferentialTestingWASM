;; 6. **Test Description 6**:    - Embed multiple nested `loops` which include `call_indirect` instructions referencing misdefined function types. The incorrect type handling in nested calls leads to infinite loops due to unhandled traps.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 f64) (result i64)))
    (table 1 funcref)
    (func $invalid-nested-call-indirect
      (local i32)
      (loop
        (loop
          (call_indirect (type 1) (i32.const 0) (i32.const 42) (f64.const 3.14))
          (br 0)
        )
        (call_indirect (type 0) (i32.const 0) (i32.const 0))
        (br 0)
      )
    )
  )
  "type mismatch"
)