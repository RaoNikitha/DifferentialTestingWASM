;; 10. Generate a test where a valid operand stack and function table lookup for `call_indirect` ultimately calls a function with a mismatched return value type, ensuring proper trapping due to incorrect return value handling.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32) (result f64)))
    (table funcref (elem $f))
    (func $f (param i32) (result f64) (f64.const 0))
    (func $test
      (call_indirect (type $sig1) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)