;; Test 10: Simulate a scenario with indirect function calls, where an invalid table lookup causes control flow to hit an 'unreachable' instruction.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func-0)
    (func $caller
      (call_indirect (type 0) (i32.const 2) (i32.const 3))
      unreachable
    )
    (func $func-0 (param i32) (result i32) (i32.const 42))
  )
  "undefined element"
)