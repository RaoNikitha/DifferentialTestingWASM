;; 8. **Test Complex Loop with Indirect Branch**:    Create a scenario where `br_table` instruction indirectly references an out-of-bounds index, causing the loop execution to never break correctly, leading to an infinite loop.

(assert_invalid
  (module (func $complex-loop-indirect-branch
    (loop (result i32) (i32.const 1)
      (block (br_table 1 2 0 (i32.const 3)))
    )
  ))
  "type mismatch"
)