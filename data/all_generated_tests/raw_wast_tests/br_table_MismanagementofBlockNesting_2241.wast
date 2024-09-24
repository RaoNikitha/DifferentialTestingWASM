;; 1. **Single Nested Block with Out of Bounds Default Index:**    - Test a `br_table` instruction within a single nested block where the operand points to an out-of-bounds index, and ensure the default target is correctly interpreted as the enclosing block.    - Verifies if the nested block structure is correctly maintained and the default label is accurately targeted when operand index is invalid.

(assert_invalid
  (module
    (func
      (block
        (block
          (br_table 0 1 (i32.const 2))
        )
      )
    )
  )
  "unknown label"
)