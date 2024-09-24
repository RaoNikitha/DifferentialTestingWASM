;; 8. **Multiple Sequential `br_table` with Interdependent Indexing:**    Chain several `br_table` instructions with interdependent label indexing where an operand affects multiple subsequent branches. Ensure CFG properly manages these intertwining branches and maintains correct execution flow.

(assert_invalid
  (module
    (func (param i32)
      (block
        (loop
          (block $inner
            (br_table 1 2 0 (local.get 0))
          )
          (br_table 2 1 (i32.const 1))
        )
      )
    )
  )
  "unknown label"
)