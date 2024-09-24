;; 7. **Test Description**: `br_table` directly within a loop structure, with each target ending in a `return` instruction, testing behavior when indirect branches occur within loops.    - **Constraint**: Validates correct handling and stack unwinding when the `return` instruction is inside loop-controlled branches.

(assert_invalid
  (module
    (func $loop_with_br_table_returns (result i32)
      (loop (result i32)
        (i32.const 0)
        (br_table 0 (return (i32.const 1)) (return (i32.const 2)))
      )
    )
  )
  "type mismatch"
)