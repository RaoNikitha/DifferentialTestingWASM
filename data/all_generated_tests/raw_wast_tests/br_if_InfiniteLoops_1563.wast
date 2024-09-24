;; 4. **Test 4**: A `loop` instruction with multiple `br_if` instructions, where one instruction correctly evaluates to break the loop and the other does not. Differentiating between handling reachable code pathways.

(assert_invalid
  (module
    (func $test-loop-br_if-multiple
      (loop (result i32)
        (br_if 0 (i32.const 1) (i32.const 2))
        (br_if 1 (i32.const 0))
      )
    )
  )
  "type mismatch"
)