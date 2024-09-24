;; - **Test 10**: Use an indirect function call (`call_indirect`) where the table entry has incorrect types (`i64` instead of expected `i32`). Validates table type checks and consistent function type application.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i32)))
    (table anyfunc (elem func 0))
    (func (result i32)
      (call_indirect (type 0) (i64.const 42) (i32.const 0))
    )
  )
  "type mismatch"
)