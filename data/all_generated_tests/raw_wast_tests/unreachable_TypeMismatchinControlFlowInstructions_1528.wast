;; 9. Test a `call` to a function that ends with an `unreachable` instruction, then use the result of the call in an arithmetic operation, leading to a type mismatch due to the incoming trap.

(assert_invalid
  (module (func $test_func (result i32)
    unreachable
  )
  (func $main
    (call $test_func)
    (i32.add (i32.const 1))
  ))
  "type mismatch"
)