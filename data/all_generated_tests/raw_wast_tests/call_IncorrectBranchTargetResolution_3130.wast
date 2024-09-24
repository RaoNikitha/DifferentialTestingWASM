;; - Test 9: Develop a function calling another function containing both `br` and `br_table` to maintain specific flow control. Confirm if the branch instructions after the call correctly jump to the expected block addresses.

(assert_invalid
  (module
    (type $sig (func))
    (type $sig-param (func (param i32)))
    (func $f (result i32)
      (i32.const 1)
      (call $g)
      (br_table 0 1 (i32.const 0))
    )
    (func $g (result i32)
      (i32.const 2)
      (br 1)
    )
  )
  "type mismatch"
)