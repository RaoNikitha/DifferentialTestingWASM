;; 9. Develop a test for improper operand handling where `call_indirect` is used with an `i32` operand that is manipulated to exceed the table size during execution, resulting in a trap due to boundary violation.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32) (result i32)
      local.get 0)
    (func $test
      (call_indirect (type 0) (i32.add (i32.const 1) (i32.const 1)))
    )
  )
  "type mismatch"
)