;; 3. **Test Description**: A `block` with multiple `block` instructions inside and a `br_table` that uses the indices to target different blocks.    **Reasoning**: Ensures the branching table correctly indexes and jumps to the targeted blocks.

(assert_invalid
  (module (func $br_table_multiple_blocks
    (block (block (block (block (block
      (br_table 0 1 2 3 4 (i32.const 3))))))
    ))
  )
  "type mismatch"
)