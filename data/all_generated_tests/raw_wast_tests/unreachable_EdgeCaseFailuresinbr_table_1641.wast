;; 2. Implement a `br_table` instruction with an index out of bounds (greater than the number of targets by one) preceding an `unreachable` instruction. Check whether the trap triggering is immediate and consistent upon out-of-bounds access.

(assert_invalid
  (module (func $test-unreachable-with-br_table
    (block
      (block
        (br_table 0 1 2 (i32.const 3))
        (unreachable)
      )
      (drop)
    )
  ))
  "type mismatch"
)