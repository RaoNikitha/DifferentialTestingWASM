;; 7. Use a `br_table` instruction with indices exceeding the target count within a loop that contains an `unreachable` instruction outside the loop. This checks if the failure to find a valid index correctly triggers the `unreachable` outside the loop.

(assert_invalid
  (module (func $type-br_table-unreachable
    (loop
      (br_table 1 2 (i32.const 0))
    )
    (unreachable)
  ))
  "type mismatch"
)