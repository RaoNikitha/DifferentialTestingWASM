;; 10. Design a test where a `call_indirect` instruction targets a function with a large number of parameters and returns. Fill the operand stack to near its limit before the call, testing for handling of extensive operand operations and preventing stack overflows.

(assert_invalid
  (module
    (type (func (param i32 i32 i32 i32 i32 i32) (result i32 i32 i32)))
    (table funcref (elem 0 1 2))
    (func $f (param i32 i32 i32 i32 i32 i32) (result i32 i32 i32) (i32.const 1) (i32.const 2) (i32.const 3))
    (func $test
      (i32.const 0)
      (i32.const 1)
      (i32.const 2)
      (i32.const 3)
      (i32.const 4)
      (i32.const 5)
      (call_indirect (type 0) (i32.const 2))
    )
  )
  "type mismatch"
)