;; 4. Test a `call_indirect` instruction where an invalid table index (out of bounds) is provided, to verify if both implementations properly trap for invalid index addressing.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func
      (i32.const 1) (call_indirect (type 0) (i32.const 2))
    )
  )
  "out of bounds table index"
)