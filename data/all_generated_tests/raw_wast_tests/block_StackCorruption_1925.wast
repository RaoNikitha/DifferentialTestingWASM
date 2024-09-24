;; Test 6: A `block` containing an instruction sequence that pushes several values onto the stack, followed by an `unreachable` instruction. Check to ensure that `unreachable` correctly triggers a trap without causing intermediate stack corruption.

(assert_invalid
  (module (func $unreachable-block
    (block
      (i32.const 42) (i32.const 43) (i32.const 44)
      unreachable
    )
  ))
  "unreachable code must not reach end of block"
)