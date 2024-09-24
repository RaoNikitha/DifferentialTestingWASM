;; - Test 10: Design a block that invokes a `call_indirect` to a function with a mismatched parameter type from the block's expected input type, ensuring the check involves both input and output types for indirect calls.

(assert_invalid
  (module
    (type $t (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $type-mismatch-function)
    (func $type-mismatch-function (param i64))
    (func $test (param i32)
      (block (call_indirect (type $t) (i32.const 0) (i64.const 42)))
    )
  )
  "type mismatch"
)