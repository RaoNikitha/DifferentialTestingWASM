;; 5. **Test 5**: Create a `loop` that contains an `if` instruction within it. The `else` block should contain a `br` instruction to restart the loop. Analyze if improper resetting of the state causes an infinite loop due to improper condition evaluation.

(assert_invalid
  (module
    (func $test5
      (loop (if (else (br 1))) (br 0))
    )
  )
  "type mismatch"
)