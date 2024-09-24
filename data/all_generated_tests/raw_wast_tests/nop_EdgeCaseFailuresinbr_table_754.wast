;; 5. Structure a test where a `nop` precedes a `br_table` instruction and the index is negative, ensuring that both implementations flag this as invalid gracefully.

(assert_invalid
  (module
    (func $test-br_table
      (nop)
      (block
        (br_table -1 (block))))
  )
  "invalid table index"
)