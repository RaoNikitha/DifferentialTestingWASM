;; 6. Design a `br_table` instruction within a block nested within a loop. Use operand values that cause branching out of the loop but within the block structure to verify correct block boundary recognition.

(assert_invalid
  (module (func $nested-loop-br_table
    (loop (block
      (br_table 1 0 (i32.const 2)) (nop)
    ))
  ))
  "unknown label"
)