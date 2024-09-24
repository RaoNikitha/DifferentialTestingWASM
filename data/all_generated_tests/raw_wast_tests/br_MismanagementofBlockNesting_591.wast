;; 2. Create nested `loop` and `block` structures where the `br` instruction targets labels inside nested loops (e.g., `loop (block (loop (br 1)))`). This verifies whether the implementation can correctly handle jumping to the appropriate loop start.

(assert_invalid
  (module
    (func $nested-loop-br
      (loop (block (loop (br 1))))
    )
  )
  "type mismatch"
)