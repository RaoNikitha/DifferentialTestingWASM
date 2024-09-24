;; 8. Devise a loop with a complex set of `br_table` instructions where one case leads to an `unreachable` instruction being hit. The test verifies if selecting this case from the jump table results in an immediate trap, ensuring no further looping.

(assert_invalid
  (module (func $test_br_table_unreachable
    (loop (br_table 0 1 2 (i32.const 3) (unreachable)))
  ))
  "type mismatch"
)