;; Create a `br_table` instruction where the operand is dynamically manipulated in such a way that a label index initially matches but later mismatches, leading to an `unreachable` instruction. This test checks if dynamic operand handling and runtime evaluation of indices are consistent.

(assert_invalid
  (module
    (func (param i32)
      (block (result i32)
        (block
          (br_table 0 1 2 (local.get 0) (local.set 0 (i32.const 10)))
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)