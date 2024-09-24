;; 5. Implement a `call_indirect` invocation where the table index operand is `i32`, but ensure the related function index selected has a different expected input or output type. This will test type enforcement on table index operands.

(assert_invalid
  (module
    (type (func (param i64) (result i64)))
    (table 1 funcref)
    (func (result i64)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)