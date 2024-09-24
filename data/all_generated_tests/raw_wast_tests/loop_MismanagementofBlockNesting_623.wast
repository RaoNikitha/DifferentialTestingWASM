;; 4. **Mixed Block Types**: Create a nested loop containing mixed block types (`block`, `loop`, `if`) with branches (`br_table`) to check if each block’s label is correctly interpreted in terms of depth and scopes, especially focusing on consistency of label indexing.

(assert_invalid
  (module (func $nested_mixed_block_types
    (block 
      (loop (result i32)
        (i32.const 42)
        (block (result i32)
          (i32.add)
        )
        (if (result i32)
          (i32.const 1)
          (then (br 1))
          (else (br 0))
        )
        (i32.add)
      )
    )
  ))
  "type mismatch"
)