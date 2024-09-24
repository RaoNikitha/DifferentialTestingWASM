;; - **Test 6:**    A `loop` that contains a stack-manipulating instruction that changes the stack state before a `br` instruction, which always branches unconditionally to the loop-start without verifying if the correct operands are on the stack, leading to an infinite loop.

(assert_invalid
  (module
    (func $test-loop
      (loop (br 0))
    )
  )
  "unreachable"
)