;; 3. **Outer Block Exit with Incorrect Label Indexing:**    Branch outwards from a deeply nested block to an outer block, but misindex the label referencing its nested depth. Ensure the control flow correctly identifies this misindexing leading to improper CFG resolution.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block
          (br_table 1 0 (i32.const 0))
        )
      )
    )
  )
  "unknown global"
)