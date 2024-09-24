;; 4. **Excessive Operands in BrTable:**    - Create a `br_table` instruction that attempts to branch with a larger-than-expected operand stack, monitoring for any stack overflow or unexpected stack behavior.

(assert_invalid
  (module (func $excessive-operands
    (block (i32.const 1) (i32.const 2) (i32.const 3)
      (br_table 0 1 2 (i32.const 4))
    )
  ))
  "unknown label"
)