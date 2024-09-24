;; 5. Test a scenario where multiple `br_table` instructions are chained through multiple nested blocks, each referring to labels defined at different nesting levels. This ensures that the implementation correctly maintains the context of each nested level.

(assert_invalid
  (module
    (func
      (block (block (block
        (br_table 1 0 (i32.const 2))
        (loop (block
          (br_table 0 1 (i32.const 0))
        ))
      )))
    )
  )
  "unknown label"
)