;; Construct a `br_table` instruction within an `if-else` block, where the default label references an incorrect operand type upon branching into the else block. This can verify type correctness enforcement as the control flows conditionally.

(assert_invalid
  (module (func $if_else_mismatch
    (block (if (i32.const 1)
      (then (br_table 0 (i32.const 0)))
      (else (br_table 0 (i64.const 0)))
    ))
  ))
  "type mismatch"
)