;; 2. Use a `br_table` instruction with a vector of labels and a default label, where the operand indexes beyond the valid range. Ensure the default label is targeted without causing stack corruption.

(assert_invalid
  (module
    (func $test-br_table-out-of-bounds
      (block (br_table 0 1 2 (i32.const 4)))
    )
  )
  "unknown label"
)