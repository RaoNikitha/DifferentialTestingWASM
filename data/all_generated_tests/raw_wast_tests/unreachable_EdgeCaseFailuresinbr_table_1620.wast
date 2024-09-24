;; 1. Insert an `unreachable` instruction immediately before a `br_table` instruction with an index that is one greater than the number of available targets. This checks if the `unreachable` instruction triggers a trap before the `br_table` handles the out-of-bounds index.

(assert_invalid
  (module
    (func (unreachable) (br_table 0 1))
  )
  "type mismatch"
)