;; 1. **Test Description**: Call a function with an unreachable code block followed by a valid computation. Ensure the `call` causes an `unreachable` instruction execution due to improper popping of incorrect argument types.

(assert_invalid
  (module
    (func $unreachable-followed-by-valid-call
      unreachable
      (call 1 (i32.const 1))
    )
    (func (param i32))
  )
  "type mismatch"
)