;; 3. **Test3: Deeply Nested Blocks**    - **Description:** Implement a `br_table` within multiple nested blocks, checking label indices that require precise handling of relative indexing.    - **Stack Corruption Check:** Evaluate if the integrity of the stack is maintained throughout the nested structure.

(assert_invalid
  (module (func $nested-br_table
    (block
      (block 
        (block 
          (block 
            (br_table 0 1 2 3 (i32.const 4))
          )
        )
      )
    )
  ))
  "unknown label"
)