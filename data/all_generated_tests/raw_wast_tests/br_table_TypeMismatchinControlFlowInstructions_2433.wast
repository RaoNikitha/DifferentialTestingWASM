;; Create a `br_table` instruction where all target labels expect operands of type `i32`, but the branch indexed at a specific position expects an operand of type `f32`. This should test type mismatches in the implementation’s label handling.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (block (result f32)
            (br_table 0 1 2 (i32.const 1) (local.get 0))
          )
        )
      )
    )
  )
  "type mismatch"
)