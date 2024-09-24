;; 5. **Complex Control Flow with `br_table`**:    Design a set of nested blocks involving `br_table` to jump to different depths based on a dynamic value. This tests dynamic control flow and verifies if the implementation manages stack and execution states correctly for each branch target.

(assert_invalid
  (module (func $complex-control (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 2 (i32.const 1)) ; should jump to block 1
          (return (i32.const 3))
        )
        (return (i32.const 2))
      )
      (return (i32.const 1))
    )
  ))
  "type mismatch"
)