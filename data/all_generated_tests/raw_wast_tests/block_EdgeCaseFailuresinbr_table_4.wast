;; 5. **Test with Indirect Branching in Nested Blocks**:    - Implement nested blocks with `br_table` inside the innermost block, referencing indices that resolve to labels in outer blocks.    - *Constraint*: Ensures proper index resolution across multiple block levels.    - *Relation*: Evaluates label stack shifts across multiple nesting levels when handling indirect branches.

(assert_invalid
  (module (func
    (block (result i32) 
      (block (result i32) 
        (block 
          (block 
            (br_table 0 1 2 (i32.const 0))
          ) 
          (i32.const 0)
        ) 
        (i32.const 0)
      ) 
      (i32.const 0)
    )
  ))
  "type mismatch"
)