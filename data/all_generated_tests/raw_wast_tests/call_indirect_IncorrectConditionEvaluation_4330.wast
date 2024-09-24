;; 9. **Test 9**: Construct a scenario where `call_indirect` references a table index that was dynamically modified, resulting in a type mismatch post modification. Validate if the dynamic table state is correctly handled and trapped in both implementations, highlighting condition evaluation on the fly.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table funcref (elem $func1 $func2))
    (func $func1 (param i32) (result i32) (i32.const 42))
    (func $func2 (param i32 i32) (result i32) (i32.const 84))
    (func $test
      (i32.const 1)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)