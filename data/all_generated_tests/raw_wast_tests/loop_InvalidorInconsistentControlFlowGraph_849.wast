;; Construct a loop where a backward `br_table` instruction's operand is out of bounds, testing if the CFG handles out-of-bounds branch destinations correctly and targets the default branch.

(assert_invalid
  (module
    (func (loop (block (br_table 1 2 3 4 5 6 0) (drop)) (end)) (return))
  )
  "type mismatch"
)