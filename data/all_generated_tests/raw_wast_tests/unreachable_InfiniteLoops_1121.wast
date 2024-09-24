;; 2. Construct a loop that contains a nested conditional block, which itself contains an `unreachable` instruction. The `br_if` instruction within the loop should normally exit the loop based on a condition, but the condition will lead to the nested block being entered, triggering the `unreachable` instruction. This tests if the trap stops the loop correctly.

(assert_invalid
  (module (func $unreachable-in-loop-with-conditional
    (loop
      (block
        (br_if 0 (i32.const 1))
        (if (result i32)
          (then (unreachable) (i32.const 0))
          (else (i32.const 1))
        )
      )
    )
  ))
  "type mismatch"
)