;; 6. **Test for Incorrect Branching with `br_table`**:    Create a loop with a `br_table` instruction that uses an out-of-bounds index, ensuring it correctly defaults to a specified label. This verifies the correct handling of indirect branches and default targets.

(assert_invalid
  (module (func $br_table_loop (result i32)
    (i32.const 3)
    (loop (result i32)
      (block (block (block
        (i32.const 0)
        (br_table 0 1 2 3)
        (i32.const 1)
      )))
    )
  ))
  "type mismatch"
)