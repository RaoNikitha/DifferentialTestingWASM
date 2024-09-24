;; 10. **Test Description:**    Validate br_table with nested blocks where laboriously crafted multiple layers of labels ensure that only the precise calculated relative index matches the correct block, ensuring that deeply nested block handling doesn't break control flow structure.    - **Specific Constraint:** Checks nested indexing and label management.    - **Edge Case Relation:** Deeply nested mismanagement would break structural control flow rules causing misbranching.

(assert_invalid
  (module (func $nested-blocks
    (block
      (block
        (block 
          (block
            (br_table 0 1 2 (i32.const 3)) 
          )
        )
      )
    ) 
  ))
  "unknown label"
)