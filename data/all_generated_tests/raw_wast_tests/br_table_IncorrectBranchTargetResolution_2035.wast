;; 6. **Multiple Label Indices with One Arity Different:**    - Construct a `br_table` instruction with several label indices where only one label has a different arity than the others.    - *Testing for*: Arity mismatch detection within label vectors.    - *Constraint*: Operand type length and matching.

(assert_invalid
  (module
    (func $br_table_arity_mismatch
      (block
        (block (result i32)
          (br_table 0 1 2 (i32.const 0) (i32.const 1) (nop))
        )
        (drop)
      )
    )
  )
  "type mismatch"
)