;; 6. **Mixed Blocks with Cross-block Branching:**    - Design a nested structure with mixed blocks and `br_table` instructions referencing labels from different blocks.    - Ensures cross-block branches are correctly handled and operand type sequences match expected types at branch targets.

(assert_invalid
  (module 
    (func $mixed-blocks 
      (block (result i32) 
        (block 
          (block (result f32) 
            (block
              (br_table 0 2 1 1 (i32.const 0))
            )
          )
        )
        (drop)
      )
      (drop)
    )
  )
  "type mismatch"
)