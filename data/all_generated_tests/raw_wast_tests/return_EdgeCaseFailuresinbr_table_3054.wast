;; Use a `br_table` instruction followed by a `return` where the index is the maximum possible integer value to see if either implementation crashes or returns incorrectly. This tests index boundary handling and the difference in how each version handles stack states.

(assert_invalid
  (module
    (func $test (block (br_table 0 (i32.const 0xFFFFFFFF))) (return))
  )
  "type mismatch"
)