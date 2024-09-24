;; 1. Create a function that calls another function, which contains an `unreachable` instruction followed by additional operations. The test checks if the stack is maintained correctly, ensuring that no operations after the `unreachable` are executed.

(assert_invalid
  (module
    (func $callee
      (unreachable)
      (i32.const 42)
    )
    (func $caller
      (call $callee)
      (i32.const 10)
      (i32.add)
    )
  )
  "type mismatch"
)