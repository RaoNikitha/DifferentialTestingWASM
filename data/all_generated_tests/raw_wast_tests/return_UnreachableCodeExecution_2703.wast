;; Test 2: Have a `return` in a block followed by an `unreachable` instruction in the main body. Reason: Checks if the `return` properly branches to the outer block. Incorrect implementation may hit `unreachable`.

(assert_invalid
  (module
    (func $return-in-block (result i32)
      (block
        (return (i32.const 42))
      )
      unreachable
    )
  )
  "type mismatch"
)