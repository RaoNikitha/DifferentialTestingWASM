;; 6. Test Description: **Nested Blocks with Indices Targeting Labels within Inner Blocks**    - **Constraint Checked:** Correctness of relative indices within nested blocks.    - **How it Relates:** Ensuring that relative references to labels within nested blocks are computed correctly without falling back to incorrect targets or the default label.

(assert_invalid
  (module (func 
    (block 
      (block 
        (block (result i32)
          (br_table 2 (block (result i32) (i32.const 0)) (i32.const 1))
        ) 
        (block 
          (br_table 1 3 (i32.const 0)) 
        )
      ) 
    )
  ))
  "unknown label"
)