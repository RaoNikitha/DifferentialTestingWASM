;; 5. Design a nested block where the inner block’s `br_table` instruction uses an out-of-bounds index, followed by an `unreachable` instruction. Check the handling of inner block traps for out-of-bounds indices.

(assert_invalid
  (module (func (block (br_table 1 (unreachable))))
    "br_table index out of bounds"
  )
)