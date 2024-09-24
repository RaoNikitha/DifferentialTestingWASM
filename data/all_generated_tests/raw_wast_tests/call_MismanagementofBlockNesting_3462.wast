;; 1. **Nested Loops with Function Call**:    - Check if the function call within nested loops correctly manages stack frames and returns to the right loop. Ensure the index lookup is properly executed.    - Verify that exiting one loop and immediately entering another with a `call` instruction does not mismanage the stack.

(assert_invalid
  (module
    (func $nested-loop-call
      (block
        (loop
          (br 1 (call $inner (i32.const 1) (i32.const 1)))
        )
      )
    )
    (func $inner (param i32)
      (loop
        (br 1 (call $deeper (i32.const 2)))
      )
    )
    (func $deeper (param i32 i32))  ; Mismatched parameter type
  )
  "type mismatch"
)