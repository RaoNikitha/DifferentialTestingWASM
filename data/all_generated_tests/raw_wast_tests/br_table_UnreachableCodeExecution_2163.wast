;; 3. Craft a `br_table` instruction within a `loop` construct with an operand that matches no labels. Direct the default label to an unreachable code block to check if the loop erroneously branches into the `unreachable` block, causing the program to crash.

(assert_invalid
  (module (func
    (loop (br_table 0 1 (i32.const 2)))
    (unreachable)
  ))
  "unknown label"
)