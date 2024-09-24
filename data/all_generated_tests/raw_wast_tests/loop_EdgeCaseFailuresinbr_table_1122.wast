;; 3. **Test Description**:    - Design a loop where the `br_table` instruction has duplicate indices pointing to different labels.    - Ensure that the correct label is targeted based on the index provided.    - This checks if the `br_table` correctly maps duplicate indices.    -

(assert_invalid
  (module (func $duplicate-label-br_table
    (block (loop (block (result i32)
      (i32.const 2)
      (br_table 0 1 0)
      (i32.const 0)
    )))
  ))
  "br_table target label index mismatch"
)