;; Test1: Create a `br_table` instruction within a block that contains another block. The operand indexes the inner block's label incorrectly and uses all available labels. Expect the `wizard_engine` to throw a `BrTableArityMismatch` error because of incorrect nesting depth, while WebAssembly continues without error.

(assert_invalid
  (module
    (func (param i32)
      (block
        (block
          (br_table 1 0 (local.get 0))
        )
      )
    )
  )
  "unknown label"
)