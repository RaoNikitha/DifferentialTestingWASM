;; Write a `br_table` instruction in a block that includes several nested blocks, where the default label should exit the outermost block. One of the target labels should include an operand mismatch to ensure the branches are checked against the expected types of the containing blocks.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (block (br_table 1 2) (i32.const 3))
          )
          (block (i32.const 3)) ;; This target label will cause an operand type mismatch
        )
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)