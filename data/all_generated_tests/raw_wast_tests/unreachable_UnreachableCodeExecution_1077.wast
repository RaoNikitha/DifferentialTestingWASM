;; 8. Position the `unreachable` instruction immediately after a function call that pushes a result to the stack, checking that the trap occurs and does not incorrectly process the stack result.

(assert_invalid
  (module
    (func $test (result i32)
      (call $some_function)
      unreachable
      i32.add
    )
  )
  "type mismatch"
)