;; Test 9: A `loop` block with an immediate instruction sequence that modifies the stack types such that the result type specified in the `blocktype` is not satisfied upon reaching the `end` instruction.

(assert_invalid
  (module (func $test9
    (loop (result i32)
      (i32.const 42)
      (i32.add)
    )
  ))
  "type mismatch"
)