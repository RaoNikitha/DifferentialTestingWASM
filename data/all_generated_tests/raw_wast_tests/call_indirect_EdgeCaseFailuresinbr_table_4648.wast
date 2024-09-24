;; 7. Test using `call_indirect` within a `br_table` with multiple possible types for the function signature, ensuring polymorphic type checking handles expected results.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32)))
    (table 1 funcref)
    (func $f1 (param i32) (result i32) (i32.const 0))
    (elem (i32.const 0) $f1)
    (func $test (param i32)
      (block
        (br_table 0 0
          (call_indirect (type $sig1) (local.get 0) (i32.const 0))
          (call_indirect (type $sig2) (local.get 0) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)