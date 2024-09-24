;; Implement a test scenario where the `br_table` instruction operands are computed within a block and expected to branch based on these dynamic computations. Incorrect resolution emerges if operands lead to unexpected branch directions due to miscalculations or misresolutions.

(assert_invalid
  (module
    (func $computed-operand
      (block (result i32)
        (local i32)
        (local.set 0 (i32.add (i32.const 1) (i32.const -2)))
        (br_table 0 1 (local.get 0))
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)