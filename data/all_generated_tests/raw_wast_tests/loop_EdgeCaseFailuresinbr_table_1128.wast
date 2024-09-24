;; 9. **Test Description**:    - Create a loop encompassing another block type (e.g., `if`) with a `br_table` that can branch to either the loop or the inner block.    - Check if branching behaviour is correctly managed.    - This evaluates branch management across multiple control structures.    -

(assert_invalid
  (module
    (func $test_loop_branching
      (local i32)
      (loop (result i32)
        (block (result i32)
          (i32.const 0)
          (br_table 0 1 1)
        )
      )
    )
  )
  "type mismatch"
)