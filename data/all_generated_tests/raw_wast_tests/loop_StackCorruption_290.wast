;; - **Test 1**: Create a loop with a block type specifying an input and output type, then use a `br` instruction to branch to the loop. Ensure the operand stack is manipulated before and after the loop, such that the stack needs to be correctly unwound. This tests if the stack frames are maintained properly without corruption when branching within loops.

(assert_invalid
  (module (func $test-loop-with-branch
    (i32.const 0)
    (loop (result i32)
      (i32.const 42)
      (br 0)
      (i32.const 1)
    )
    (drop)
  ))
  "type mismatch"
)