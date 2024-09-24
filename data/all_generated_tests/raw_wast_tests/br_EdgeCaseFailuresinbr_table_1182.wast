;; - Create a deeply nested `br_table` scenario where the index points to the outermost label, checking if the label resolution correctly navigates through multiple nested blocks.

(assert_invalid
  (module (func
    (block 
      (block 
        (block 
          (block 
            (br_table 0 1 2 3 (i32.const 3))
          )
        )
      )
    )
  ))
  "unknown label"
)