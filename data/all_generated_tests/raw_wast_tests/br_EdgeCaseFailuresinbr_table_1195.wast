;; 6. Implement a `br_table` instruction with the highest possible index determined by the integer type limitations (e.g., maximum i32 value), testing for overflow behavior and correct default/error handling. This tests for handling of edge range indices.

(assert_invalid
  (module (func $large-label
    (block
      (block
        (block
          (br_table 0 0x7fffffff 0 (i32.const 1))
        )
      )
    )
  ))
  "unknown label"
)