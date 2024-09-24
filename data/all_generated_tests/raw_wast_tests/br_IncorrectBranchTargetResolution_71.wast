;; 2. Design a test with mixed nesting of blocks and loops, where the `br` instruction targets an innermost loop. Check if the branch correctly jumps to the beginning of the loop, ensuring the label resolution does not mistakenly target a neighboring block.

(assert_invalid
  (module
    (func $test
      (block (block (loop (br 2) (end)) (end)) (end))
    )
  )
  "unknown label"
)