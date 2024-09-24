;; 9. Construct a test with a `call_indirect` instruction where the `typeidx` refers to a function expecting an `i32, i64` parameter sequence and the indirect call only provides `i32` types. This ensures parameter type length and order conformity.

(assert_invalid
  (module
    (type (func (param i32 i64)))
    (table 0 funcref)
    (func
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)