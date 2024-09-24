;; 9. Design a `br_table` instruction scenario where the default label is triggered due to an over-bound index, ensuring that the implementation consistently uses the default in all edge cases and avoids undefined behaviors or exceptions.

(assert_invalid
  (module (func $test-over-bound-index-default
    (block (br_table 0 1 2 3 4 5 6 7 (i32.const 10)))
  ))
  "unknown label"
)