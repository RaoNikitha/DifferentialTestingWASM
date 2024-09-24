;; Test 8: A `loop` block with a `br` instruction to a label that assumes the stack has been unwound to a specific type state, but the previous `loop` instruction leaves a mismatched type on the stack.

(assert_invalid
  (module (func $loop-br-stack-mismatch
    (block
      (i32.const 0)
      (loop
        (br 1)
      )
    )
  ))
  "type mismatch"
)